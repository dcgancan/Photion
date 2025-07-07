//
//  APIService.swift
//  Photion
//
//  Created by Doğancan Öztürk on 7.07.2025.
//

import Foundation
import Combine

/// API Service layer for organized network calls
class APIService: ObservableObject {
    static let shared = APIService()
    
    private let networkManager = NetworkManager.shared
    
    private init() {}
    
    // MARK: - Health & Testing
    
    /// Check server health
    func checkServerHealth() async throws -> Bool {
        return try await networkManager.healthCheck()
    }
    
    /// Test database connection
    func testDatabaseConnection() async throws -> Bool {
        return try await networkManager.databaseTest()
    }
    
    // MARK: - Authentication (Future Implementation)
    
    /// Login user
    func login(email: String, password: String) async throws -> AuthResponse {
        let request = LoginRequest(email: email, password: password)
        let response: APIResponse<AuthResponse> = try await networkManager.post(
            endpoint: AppConstants.API.Endpoints.login,
            body: request
        )
        
        guard let authData = response.data else {
            throw NetworkError.noData
        }
        
        // Store auth token
        networkManager.setAuthToken(authData.token)
        
        return authData
    }
    
    /// Register new user
    func register(email: String, password: String, name: String?) async throws -> AuthResponse {
        let request = RegisterRequest(email: email, password: password, name: name)
        let response: APIResponse<AuthResponse> = try await networkManager.post(
            endpoint: AppConstants.API.Endpoints.register,
            body: request
        )
        
        guard let authData = response.data else {
            throw NetworkError.noData
        }
        
        // Store auth token
        networkManager.setAuthToken(authData.token)
        
        return authData
    }
    
    /// Logout user
    func logout() {
        networkManager.clearAuthToken()
        // Post logout notification
        NotificationCenter.default.post(name: AppConstants.Notifications.userDidLogout, object: nil)
    }
    
    // MARK: - User Management (Future Implementation)
    
    /// Get current user profile
    func getCurrentUser() async throws -> User {
        let response: APIResponse<User> = try await networkManager.get(
            endpoint: "/api/user/profile"
        )
        
        guard let user = response.data else {
            throw NetworkError.noData
        }
        
        return user
    }
    
    /// Update user profile
    func updateUserProfile(name: String?) async throws -> User {
        let updateRequest = ["name": name]
        let response: APIResponse<User> = try await networkManager.put(
            endpoint: "/api/user/profile",
            body: updateRequest
        )
        
        guard let user = response.data else {
            throw NetworkError.noData
        }
        
        return user
    }
    
    // MARK: - Video Management (Future Implementation)
    
    /// Upload video file
    func uploadVideo(videoData: Data, fileName: String) async throws -> VideoUploadResponse {
        // TODO: Implement multipart form data upload
        fatalError("Video upload implementation pending")
    }
    
    /// Get user's videos
    func getUserVideos() async throws -> [VideoModel] {
        let response: APIResponse<[VideoModel]> = try await networkManager.get(
            endpoint: AppConstants.API.Endpoints.videos
        )
        
        return response.data ?? []
    }
    
    // MARK: - Order Management (Future Implementation)
    
    /// Create new order
    func createOrder(videoId: String, frameIndex: Int) async throws -> OrderModel {
        let orderRequest = CreateOrderRequest(videoId: videoId, frameIndex: frameIndex)
        let response: APIResponse<OrderModel> = try await networkManager.post(
            endpoint: AppConstants.API.Endpoints.orders,
            body: orderRequest
        )
        
        guard let order = response.data else {
            throw NetworkError.noData
        }
        
        return order
    }
    
    /// Get user's orders
    func getUserOrders() async throws -> [OrderModel] {
        let response: APIResponse<[OrderModel]> = try await networkManager.get(
            endpoint: AppConstants.API.Endpoints.orders
        )
        
        return response.data ?? []
    }
}

// MARK: - Future Models (Placeholder)

struct VideoUploadResponse: Codable {
    let videoId: String
    let uploadUrl: String
    let status: String
}

struct VideoModel: Codable, Identifiable {
    let id: String
    let fileName: String
    let duration: Double
    let status: String
    let createdAt: Date
}

struct CreateOrderRequest: Codable {
    let videoId: String
    let frameIndex: Int
}

struct OrderModel: Codable, Identifiable {
    let id: String
    let videoId: String
    let frameIndex: Int
    let status: String
    let createdAt: Date
    let updatedAt: Date
}