//
//  ARScanView.swift
//  Photion
//
//  Created by Doğancan Öztürk on 7.07.2025.
//

import SwiftUI

/// AR tarama görünümü
struct ARScanView: View {
    @State private var isScanning = false
    @State private var scanProgress: Double = 0.0
    @State private var showingInstructions = false
    
    var body: some View {
        VStack(spacing: 30) {
            // Başlık ve açıklama
            VStack(spacing: 15) {
                Image(systemName: "viewfinder.circle")
                    .font(.system(size: 80))
                    .foregroundColor(.green)
                
                Text("AR Tarama")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Fotoğraflarınızı tarayarak anılarınızı canlandırın")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            // Tarama alanı
            VStack(spacing: 20) {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(isScanning ? Color.green : Color.gray.opacity(0.5), lineWidth: 3)
                    .frame(height: 250)
                    .overlay(
                        VStack(spacing: 15) {
                            if isScanning {
                                // Tarama animasyonu
                                VStack(spacing: 10) {
                                    ProgressView(value: scanProgress)
                                        .progressViewStyle(LinearProgressViewStyle(tint: .green))
                                        .scaleEffect(1.2)
                                    
                                    Text("Taranıyor... \(Int(scanProgress * 100))%")
                                        .font(.headline)
                                        .foregroundColor(.green)
                                }
                                .padding()
                            } else {
                                // Tarama öncesi görünüm
                                VStack(spacing: 15) {
                                    Image(systemName: "camera.viewfinder")
                                        .font(.system(size: 50))
                                        .foregroundColor(.gray)
                                    
                                    Text("Fotoğrafı buraya yerleştirin")
                                        .font(.headline)
                                        .foregroundColor(.secondary)
                                    
                                    Text("Kamerayı fotoğrafa doğrultun")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    )
                    .padding(.horizontal)
                
                // Tarama durumu
                if !isScanning {
                    VStack(spacing: 10) {
                        HStack(spacing: 20) {
                            ScanFeature(
                                icon: "photo.fill",
                                title: "Fotoğraf Tanıma",
                                isActive: true
                            )
                            
                            ScanFeature(
                                icon: "cube.transparent",
                                title: "3D Modelleme",
                                isActive: true
                            )
                            
                            ScanFeature(
                                icon: "play.circle.fill",
                                title: "Video Oynatma",
                                isActive: true
                            )
                        }
                        .padding(.horizontal)
                    }
                }
            }
            
            // Kontrol butonları
            VStack(spacing: 15) {
                if !isScanning {
                    Button(action: startScanning) {
                        Label("Taramayı Başlat", systemImage: "viewfinder.circle.fill")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    .padding(.horizontal)
                    
                    Button(action: { showingInstructions = true }) {
                        Label("Nasıl Kullanılır?", systemImage: "questionmark.circle")
                            .font(.body)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.1))
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                } else {
                    Button(action: stopScanning) {
                        Text("Taramayı Durdur")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    .padding(.horizontal)
                }
            }
            
            Spacer()
        }
        .navigationTitle("AR Tarama")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingInstructions) {
            InstructionsView()
        }
    }
    
    private func startScanning() {
        isScanning = true
        scanProgress = 0.0
        
        // Tarama simülasyonu
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            scanProgress += 0.02
            
            if scanProgress >= 1.0 {
                timer.invalidate()
                isScanning = false
                scanProgress = 0.0
                // TODO: Tarama tamamlandı, sonuç sayfasına git
                print("AR tarama tamamlandı")
            }
        }
    }
    
    private func stopScanning() {
        isScanning = false
        scanProgress = 0.0
    }
}

/// Tarama özelliği bileşeni
struct ScanFeature: View {
    let icon: String
    let title: String
    let isActive: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(isActive ? .green : .gray)
            
            Text(title)
                .font(.caption)
                .foregroundColor(isActive ? .primary : .secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .background(isActive ? Color.green.opacity(0.1) : Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

/// Kullanım talimatları görünümü
struct InstructionsView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("AR Tarama Nasıl Kullanılır?")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        InstructionStep(
                            number: "1",
                            title: "Fotoğrafı Hazırlayın",
                            description: "Taramak istediğiniz fotoğrafı düz bir yüzeye yerleştirin."
                        )
                        
                        InstructionStep(
                            number: "2",
                            title: "Kamerayı Doğrultun",
                            description: "Cihazınızı fotoğrafın üzerine tutun ve çerçeve içinde olduğundan emin olun."
                        )
                        
                        InstructionStep(
                            number: "3",
                            title: "Taramayı Başlatın",
                            description: "Yeşil butona basarak tarama işlemini başlatın."
                        )
                        
                        InstructionStep(
                            number: "4",
                            title: "Sabit Tutun",
                            description: "Tarama sırasında cihazınızı sabit tutun ve hareket ettirmeyin."
                        )
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("İpuçları:")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Text("• İyi aydınlatma kullanın")
                        Text("• Fotoğrafın tamamının görünür olduğundan emin olun")
                        Text("• Yansıma ve gölgelerden kaçının")
                        Text("• Fotoğraf düz ve temiz bir yüzeyde olsun")
                    }
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    Spacer(minLength: 50)
                }
            }
            .navigationTitle("Kullanım Kılavuzu")
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

/// Talimat adımı bileşeni
struct InstructionStep: View {
    let number: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Text(number)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .background(Color.green)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        ARScanView()
    }
}