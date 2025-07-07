//
//  NetworkError.swift
//  Photion
//
//  Created by Doğancan Öztürk on 7.07.2025.
//

import Foundation

/// Network-related errors
enum NetworkError: Error, LocalizedError {
    case invalidURL
    case noData
    case decodingError
    case encodingError
    case serverError(Int)
    case unauthorized
    case networkUnavailable
    case timeout
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Geçersiz URL"
        case .noData:
            return "Veri bulunamadı"
        case .decodingError:
            return "Veri çözümleme hatası"
        case .encodingError:
            return "Veri kodlama hatası"
        case .serverError(let code):
            return "Sunucu hatası (\(code))"
        case .unauthorized:
            return "Yetkisiz erişim"
        case .networkUnavailable:
            return "Ağ bağlantısı yok"
        case .timeout:
            return "Bağlantı zaman aşımı"
        case .unknown(let error):
            return "Bilinmeyen hata: \(error.localizedDescription)"
        }
    }
}

/// API Response wrapper
struct APIResponse<T: Codable>: Codable {
    let success: Bool
    let data: T?
    let message: String?
    let error: String?
}

/// Empty response for endpoints that don't return data
struct EmptyResponse: Codable {}