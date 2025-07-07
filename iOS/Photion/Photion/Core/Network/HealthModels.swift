//
//  HealthModels.swift
//  Photion
//
//  Created by Doğancan Öztürk on 7.07.2025.
//

import Foundation

/// Health check response model
struct HealthResponse: Codable {
    let status: String
    let timestamp: String
}

/// Database test response model
struct DatabaseTestResponse: Codable {
    let success: Bool
    let message: String
    let error: String?
    let timestamp: String
}