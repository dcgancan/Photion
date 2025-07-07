//
//  AppConstants.swift
//  Photion
//
//  Created by Doğancan Öztürk on 7.07.2025.
//

import Foundation

// MARK: - App Constants
struct AppConstants {
    
    // MARK: - API Configuration
    struct API {
        static let baseURL = "https://api.photion.com"
        static let version = "v1"
        static let timeout: TimeInterval = 30.0
        
        // Endpoints
        struct Endpoints {
            static let auth = "/auth"
            static let login = "/auth/login"
            static let register = "/auth/register"
            static let refresh = "/auth/refresh"
            static let videos = "/videos"
            static let upload = "/videos/upload"
            static let process = "/videos/process"
            static let orders = "/orders"
        }
    }
    
    // MARK: - App Configuration
    struct App {
        static let name = "Photion"
        static let version = "1.0.0"
        static let buildNumber = "1"
        static let bundleIdentifier = "com.dogancanozturk.Photion"
    }
    
    // MARK: - User Defaults Keys
    struct UserDefaultsKeys {
        static let authToken = "auth_token"
        static let refreshToken = "refresh_token"
        static let userId = "user_id"
        static let isFirstLaunch = "is_first_launch"
        static let userPreferences = "user_preferences"
    }
    
    // MARK: - Keychain Keys
    struct KeychainKeys {
        static let authToken = "photion_auth_token"
        static let refreshToken = "photion_refresh_token"
    }
    
    // MARK: - Video Configuration
    struct Video {
        static let maxDurationSeconds: Double = 30.0
        static let minDurationSeconds: Double = 3.0
        static let maxFileSizeMB: Double = 100.0
        static let supportedFormats = ["mp4", "mov", "m4v"]
        static let preferredQuality = "1080p"
    }
    
    // MARK: - AR Configuration
    struct AR {
        static let markerSize: Float = 0.1 // 10cm
        static let trackingTimeout: TimeInterval = 5.0
        static let maxTrackingDistance: Float = 2.0 // 2 meters
    }
    
    // MARK: - UI Configuration
    struct UI {
        static let animationDuration: Double = 0.3
        static let cornerRadius: CGFloat = 12.0
        static let shadowRadius: CGFloat = 8.0
        static let defaultPadding: CGFloat = 16.0
    }
    
    // MARK: - Notification Names
    struct Notifications {
        static let userDidLogin = Notification.Name("userDidLogin")
        static let userDidLogout = Notification.Name("userDidLogout")
        static let videoUploadCompleted = Notification.Name("videoUploadCompleted")
        static let orderStatusChanged = Notification.Name("orderStatusChanged")
    }
    
    // MARK: - Error Messages
    struct ErrorMessages {
        static let networkError = "Ağ bağlantısı hatası. Lütfen tekrar deneyin."
        static let authenticationError = "Giriş yapılamadı. Bilgilerinizi kontrol edin."
        static let videoUploadError = "Video yüklenemedi. Lütfen tekrar deneyin."
        static let invalidVideoFormat = "Desteklenmeyen video formatı."
        static let videoTooLarge = "Video dosyası çok büyük. Maksimum \(Video.maxFileSizeMB)MB olmalıdır."
        static let videoTooShort = "Video çok kısa. Minimum \(Video.minDurationSeconds) saniye olmalıdır."
        static let videoTooLong = "Video çok uzun. Maksimum \(Video.maxDurationSeconds) saniye olmalıdır."
    }
}