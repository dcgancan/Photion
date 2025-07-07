//
//  AuthenticationView.swift
//  Photion
//
//  Created by Doğancan Öztürk on 7.07.2025.
//

import SwiftUI

/// Authentication view for login and registration
struct AuthenticationView: View {
    @State private var isLoginMode = true
    @State private var email = ""
    @State private var password = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Logo placeholder
                Image(systemName: "camera.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.blue)
                
                Text("Photion")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // Form fields
                VStack(spacing: 16) {
                    if !isLoginMode {
                        HStack {
                            TextField("Ad", text: $firstName)
                            TextField("Soyad", text: $lastName)
                        }
                    }
                    
                    TextField("E-posta", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    SecureField("Şifre", text: $password)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Action button
                Button(action: authenticate) {
                    Text(isLoginMode ? "Giriş Yap" : "Kayıt Ol")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(isLoading)
                
                // Toggle mode button
                Button(action: { isLoginMode.toggle() }) {
                    Text(isLoginMode ? "Hesabın yok mu? Kayıt ol" : "Zaten hesabın var mı? Giriş yap")
                        .foregroundColor(.blue)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle(isLoginMode ? "Giriş" : "Kayıt")
        }
    }
    
    private func authenticate() {
        // TODO: Implement authentication logic
        isLoading = true
        
        // Placeholder implementation
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isLoading = false
            print("Authentication attempted for: \(email)")
        }
    }
}

#Preview {
    AuthenticationView()
}