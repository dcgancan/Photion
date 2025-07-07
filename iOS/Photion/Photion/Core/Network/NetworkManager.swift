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
    
    private init() {}
    
    // MARK: - API Base Configuration
    private let baseURL = "https://api.photion.com" // TODO: Update with actual API URL
    
    // MARK: - Network Methods
    
    /// Generic network request method
    func request<T: Codable>(
        endpoint: String,
        method: HTTPMethod = .GET,
        body: Data? = nil
    ) async throws -> T {
        // TODO: Implement network request logic
        fatalError("NetworkManager implementation pending")
    }
}

// MARK: - HTTP Method Enum
enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}