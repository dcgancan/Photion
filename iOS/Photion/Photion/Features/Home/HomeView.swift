//
//  HomeView.swift
//  Photion
//
//  Created by Doğancan Öztürk on 7.07.2025.
//

import SwiftUI

/// Ana sayfa görünümü
struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Hoş geldin mesajı
                VStack(alignment: .leading, spacing: 10) {
                    Text("Hoş Geldin!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Anılarını canlandırmaya hazır mısın?")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                // Özellik kartları
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 15) {
                    FeatureCard(
                        icon: "video.badge.plus",
                        title: "Video Yükle",
                        description: "Anılarını yükle",
                        color: .blue
                    )
                    
                    FeatureCard(
                        icon: "viewfinder.circle",
                        title: "AR Tarama",
                        description: "Fotoğrafları tara",
                        color: .green
                    )
                    
                    FeatureCard(
                        icon: "photo.on.rectangle",
                        title: "Galeri",
                        description: "Anılarını gör",
                        color: .purple
                    )
                    
                    FeatureCard(
                        icon: "person.2",
                        title: "Paylaş",
                        description: "Arkadaşlarla paylaş",
                        color: .orange
                    )
                }
                .padding(.horizontal)
                
                // Son aktiviteler
                VStack(alignment: .leading, spacing: 15) {
                    Text("Son Aktiviteler")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.horizontal)
                    
                    VStack(spacing: 10) {
                        ActivityRow(
                            icon: "video.fill",
                            title: "Video yüklendi",
                            subtitle: "2 saat önce",
                            color: .blue
                        )
                        
                        ActivityRow(
                            icon: "viewfinder.circle.fill",
                            title: "AR tarama yapıldı",
                            subtitle: "1 gün önce",
                            color: .green
                        )
                        
                        ActivityRow(
                            icon: "photo.fill",
                            title: "Fotoğraf eklendi",
                            subtitle: "3 gün önce",
                            color: .purple
                        )
                    }
                    .padding(.horizontal)
                }
                
                Spacer(minLength: 100)
            }
        }
        .navigationTitle("Ana Sayfa")
        .navigationBarTitleDisplayMode(.large)
    }
}

/// Özellik kartı bileşeni
struct FeatureCard: View {
    let icon: String
    let title: String
    let description: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundColor(color)
            
            VStack(spacing: 4) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(height: 120)
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
    }
}

/// Aktivite satırı bileşeni
struct ActivityRow: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(color)
                .frame(width: 30)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(10)
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}