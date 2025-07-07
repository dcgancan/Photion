//
//  NetworkManager.swift
//  Photion
//
//  Created by Doğancan Öztürk on 7.07.2025.
//

import Foundation
import Combine

/// Network layer for handling API requests
class NetworkManager: ObservableObject {
    static let shared = NetworkManager()
    
    private let session: URLSession
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    
    private init() {
        // Configure URLSession
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = AppConstants.API.timeout
        config.timeoutIntervalForResource = AppConstants.API.timeout * 2
        self.session = URLSession(configuration: config)
        
        // Configure JSON Decoder
        self.decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // Configure JSON Encoder
        self.encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.keyEncodingStrategy = .convertToSnakeCase
    }
    
    // MARK: - API Base Configuration
    private var baseURL: String {
        return AppConstants.API.baseURL
    }
    
    // MARK: - Network Methods
    
    /// Generic network request method
    func request<T: Codable>(
        endpoint: String,
        method: HTTPMethod = .GET,
        body: Data? = nil,
        headers: [String: String]? = nil
    ) async throws -> T {
        
        // Build URL
        guard let url = URL(string: baseURL + endpoint) else {
            throw NetworkError.invalidURL
        }
        
        // Create request
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        // Set default headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        // Add custom headers
        headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        // Add auth token if available
        if let token = getAuthToken() {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        do {
            // Perform request
            let (data, response) = try await session.data(for: request)
            
            // Check HTTP response
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.unknown(URLError(.badServerResponse))
            }
            
            // Handle HTTP status codes
            switch httpResponse.statusCode {
            case 200...299:
                break // Success
            case 401:
                throw NetworkError.unauthorized
            case 400...499:
                throw NetworkError.serverError(httpResponse.statusCode)
            case 500...599:
                throw NetworkError.serverError(httpResponse.statusCode)
            default:
                throw NetworkError.serverError(httpResponse.statusCode)
            }
            
            // Handle empty response
            if T.self == EmptyResponse.self {
                return EmptyResponse() as! T
            }
            
            // Decode response
            do {
                let decodedResponse = try decoder.decode(T.self, from: data)
                return decodedResponse
            } catch {
                print("Decoding error: \(error)")
                print("Response data: \(String(data: data, encoding: .utf8) ?? "nil")")
                throw NetworkError.decodingError
            }
            
        } catch let error as NetworkError {
            throw error
        } catch {
            if let urlError = error as? URLError {
                switch urlError.code {
                case .notConnectedToInternet, .networkConnectionLost:
                    throw NetworkError.networkUnavailable
                case .timedOut:
                    throw NetworkError.timeout
                default:
                    throw NetworkError.unknown(error)
                }
            }
            throw NetworkError.unknown(error)
        }
    }
    
    /// POST request with Codable body
    func post<T: Codable, U: Codable>(
        endpoint: String,
        body: T,
        headers: [String: String]? = nil
    ) async throws -> U {
        
        let bodyData: Data
        do {
            bodyData = try encoder.encode(body)
        } catch {
            throw NetworkError.encodingError
        }
        
        return try await request(
            endpoint: endpoint,
            method: .POST,
            body: bodyData,
            headers: headers
        )
    }
    
    /// PUT request with Codable body
    func put<T: Codable, U: Codable>(
        endpoint: String,
        body: T,
        headers: [String: String]? = nil
    ) async throws -> U {
        
        let bodyData: Data
        do {
            bodyData = try encoder.encode(body)
        } catch {
            throw NetworkError.encodingError
        }
        
        return try await request(
            endpoint: endpoint,
            method: .PUT,
            body: bodyData,
            headers: headers
        )
    }
    
    /// GET request
    func get<T: Codable>(
        endpoint: String,
        headers: [String: String]? = nil
    ) async throws -> T {
        return try await request(
            endpoint: endpoint,
            method: .GET,
            headers: headers
        )
    }
    
    /// DELETE request
    func delete<T: Codable>(
        endpoint: String,
        headers: [String: String]? = nil
    ) async throws -> T {
        return try await request(
            endpoint: endpoint,
            method: .DELETE,
            headers: headers
        )
    }
    
    // MARK: - Authentication Token Management
    
    private func getAuthToken() -> String? {
        // TODO: Implement secure token storage (Keychain)
        return UserDefaults.standard.string(forKey: AppConstants.UserDefaultsKeys.authToken)
    }
    
    func setAuthToken(_ token: String) {
        // TODO: Implement secure token storage (Keychain)
        UserDefaults.standard.set(token, forKey: AppConstants.UserDefaultsKeys.authToken)
    }
    
    func clearAuthToken() {
        // TODO: Implement secure token removal (Keychain)
        UserDefaults.standard.removeObject(forKey: AppConstants.UserDefaultsKeys.authToken)
    }
    
    // MARK: - Health Check
    
    /// Test server connectivity
    func healthCheck() async throws -> Bool {
        do {
            // Backend returns: {"status":"ok","timestamp":"..."}
            let response: HealthResponse = try await get(endpoint: "/api/health")
            return response.status == "ok"
        } catch {
            return false
        }
    }
    
    /// Test database connectivity
    func databaseTest() async throws -> Bool {
        do {
            // Backend returns: {"success":false,"message":"...","timestamp":"..."}
            let response: DatabaseTestResponse = try await get(endpoint: "/api/db/test")
            return response.success
        } catch {
            return false
        }
    }
}

// MARK: - HTTP Method Enum
enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
    case PATCH = "PATCH"
}