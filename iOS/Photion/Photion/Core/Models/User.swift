//
//  User.swift
//  Photion
//
//  Created by Doğancan Öztürk on 7.07.2025.
//

import Foundation

/// User model for authentication and user management
struct User: Codable, Identifiable {
    let id: UUID
    let email: String
    let firstName: String
    let lastName: String
    let createdAt: Date
    let updatedAt: Date
    
    // MARK: - Computed Properties
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    var initials: String {
        let firstInitial = firstName.first?.uppercased() ?? ""
        let lastInitial = lastName.first?.uppercased() ?? ""
        return "\(firstInitial)\(lastInitial)"
    }
}

// MARK: - User Authentication Models
struct LoginRequest: Codable {
    let email: String
    let password: String
}

struct RegisterRequest: Codable {
    let email: String
    let password: String
    let firstName: String
    let lastName: String
}

struct AuthResponse: Codable {
    let user: User
    let token: String
    let refreshToken: String
}