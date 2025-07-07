//
//  ProfileView.swift
//  Photion
//
//  Created by Doğancan Öztürk on 7.07.2025.
//

import SwiftUI

/// Profil görünümü
struct ProfileView: View {
    @State private var showingSettings = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                // Profil başlığı
                VStack(spacing: 15) {
                    // Profil fotoğrafı
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.blue)
                    
                    VStack(spacing: 5) {
                        Text("Kullanıcı Adı")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("user@example.com")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    
                    Button("Profili Düzenle") {
                        // TODO: Profil düzenleme sayfasına git
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
                
                // İstatistikler
                HStack(spacing: 30) {
                    StatisticView(title: "Videolar", value: "12")
                    StatisticView(title: "AR Taramalar", value: "8")
                    StatisticView(title: "Paylaşımlar", value: "5")
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal)
                
                // Menü seçenekleri
                VStack(spacing: 0) {
                    ProfileMenuItem(
                        icon: "video.fill",
                        title: "Videolarım",
                        subtitle: "Yüklediğin videoları gör"
                    ) {
                        // TODO: Videolar sayfasına git
                    }
                    
                    Divider()
                        .padding(.leading, 50)
                    
                    ProfileMenuItem(
                        icon: "viewfinder.circle.fill",
                        title: "AR Taramalarım",
                        subtitle: "Geçmiş taramalarını incele"
                    ) {
                        // TODO: AR taramalar sayfasına git
                    }
                    
                    Divider()
                        .padding(.leading, 50)
                    
                    ProfileMenuItem(
                        icon: "heart.fill",
                        title: "Favorilerim",
                        subtitle: "Beğendiğin içerikler"
                    ) {
                        // TODO: Favoriler sayfasına git
                    }
                    
                    Divider()
                        .padding(.leading, 50)
                    
                    ProfileMenuItem(
                        icon: "gear",
                        title: "Ayarlar",
                        subtitle: "Uygulama ayarları"
                    ) {
                        showingSettings = true
                    }
                    
                    Divider()
                        .padding(.leading, 50)
                    
                    ProfileMenuItem(
                        icon: "questionmark.circle",
                        title: "Yardım",
                        subtitle: "Destek ve SSS"
                    ) {
                        // TODO: Yardım sayfasına git
                    }
                }
                .background(Color.white)
                .cornerRadius(15)
                .padding(.horizontal)
                
                // Çıkış yap butonu
                Button(action: {
                    // TODO: Çıkış yapma işlemi
                }) {
                    Text("Çıkış Yap")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Spacer(minLength: 100)
            }
        }
        .navigationTitle("Profil")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $showingSettings) {
            SettingsView()
        }
    }
}

/// İstatistik görünümü bileşeni
struct StatisticView: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

/// Profil menü öğesi bileşeni
struct ProfileMenuItem: View {
    let icon: String
    let title: String
    let subtitle: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 15) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
                    .frame(width: 30)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .buttonStyle(PlainButtonStyle())
    }
}

/// Ayarlar görünümü (placeholder)
struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Ayarlar")
                    .font(.title)
                    .padding()
                
                Text("Ayarlar sayfası yakında gelecek...")
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .navigationTitle("Ayarlar")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Kapat") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}