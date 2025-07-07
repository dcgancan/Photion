//
//  MainTabView.swift
//  Photion
//
//  Created by Doğancan Öztürk on 7.07.2025.
//

import SwiftUI

/// Ana tab view - uygulamanın temel navigasyon yapısı
struct MainTabView: View {
    var body: some View {
        TabView {
            // Ana Sayfa
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Ana Sayfa")
            }
            .tag(0)
            
            // Video Yükle
            NavigationStack {
                VideoUploadView()
            }
            .tabItem {
                Image(systemName: "plus.circle.fill")
                Text("Video Yükle")
            }
            .tag(1)
            
            // AR Tarama
            NavigationStack {
                ARScanView()
            }
            .tabItem {
                Image(systemName: "viewfinder.circle.fill")
                Text("AR Tarama")
            }
            .tag(2)
            
            // Profil
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person.circle.fill")
                Text("Profil")
            }
            .tag(3)
        }
        .accentColor(.blue)
    }
}

#Preview {
    MainTabView()
}