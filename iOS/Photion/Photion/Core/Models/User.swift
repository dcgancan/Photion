//
//  User.swift
//  Photion
//
//  Created by Doğancan Öztürk on 7.07.2025.
//

import Foundation

/// User model for authentication and user management
struct User: Codable, Identifiable {
    let id: Int
    let email: String
    let name: String?
    let createdAt: Date
    let updatedAt: Date
    
    // MARK: - Computed Properties
    var displayName: String {
        return name ?? email.components(separatedBy: "@").first ?? "User"
    }
    
    var initials: String {
        let components = displayName.components(separatedBy: " ")
        if components.count >= 2 {
            let firstInitial = components[0].first?.uppercased() ?? ""
            let lastInitial = components[1].first?.uppercased() ?? ""
            return "\(firstInitial)\(lastInitial)"
        } else {
            let firstTwo = String(displayName.prefix(2)).uppercased()
            return firstTwo
        }
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
    let name: String?
}

struct AuthResponse: Codable {
    let user: User
    let token: String
    let refreshToken: String
}