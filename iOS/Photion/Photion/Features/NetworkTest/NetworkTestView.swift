//
//  NetworkTestView.swift
//  Photion
//
//  Created by Doğancan Öztürk on 7.07.2025.
//

import SwiftUI

/// Network connectivity test view for development
struct NetworkTestView: View {
    @StateObject private var apiService = APIService.shared
    @State private var serverStatus: String = "Bilinmiyor"
    @State private var databaseStatus: String = "Bilinmiyor"
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // Header
                VStack(spacing: 8) {
                    Image(systemName: "network")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                    
                    Text("Network Test")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Backend bağlantısını test edin")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 20)
                
                Spacer()
                
                // Status Cards
                VStack(spacing: 16) {
                    StatusCard(
                        title: "Server Durumu",
                        status: serverStatus,
                        icon: "server.rack"
                    )
                    
                    StatusCard(
                        title: "Database Durumu",
                        status: databaseStatus,
                        icon: "cylinder.split.1x2"
                    )
                }
                
                Spacer()
                
                // Test Button
                Button(action: runTests) {
                    HStack {
                        if isLoading {
                            ProgressView()
                                .scaleEffect(0.8)
                                .foregroundColor(.white)
                        } else {
                            Image(systemName: "play.circle.fill")
                        }
                        
                        Text(isLoading ? "Test Ediliyor..." : "Bağlantıyı Test Et")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isLoading ? Color.gray : Color.blue)
                    .cornerRadius(AppConstants.UI.cornerRadius)
                }
                .disabled(isLoading)
                .padding(.horizontal)
                
                // Info Text
                Text("Server: \(AppConstants.API.baseURL)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 20)
            }
            .padding()
            .navigationTitle("Network Test")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func runTests() {
        isLoading = true
        serverStatus = "Test ediliyor..."
        databaseStatus = "Test ediliyor..."
        
        Task {
            // Test server health
            do {
                let serverHealthy = try await apiService.checkServerHealth()
                await MainActor.run {
                    serverStatus = serverHealthy ? "✅ Bağlı" : "❌ Bağlantı Yok"
                }
            } catch {
                await MainActor.run {
                    serverStatus = "❌ Hata: \(error.localizedDescription)"
                }
            }
            
            // Test database connection
            do {
                let databaseHealthy = try await apiService.testDatabaseConnection()
                await MainActor.run {
                    databaseStatus = databaseHealthy ? "✅ Bağlı" : "❌ Bağlantı Yok"
                }
            } catch {
                await MainActor.run {
                    databaseStatus = "❌ Hata: \(error.localizedDescription)"
                }
            }
            
            await MainActor.run {
                isLoading = false
            }
        }
    }
}

struct StatusCard: View {
    let title: String
    let status: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                
                Text(status)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(AppConstants.UI.cornerRadius)
    }
}

#Preview {
    NetworkTestView()
}