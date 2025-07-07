//
//  VideoUploadView.swift
//  Photion
//
//  Created by Doğancan Öztürk on 7.07.2025.
//

import SwiftUI
import PhotosUI

/// Video upload view for selecting and uploading videos
struct VideoUploadView: View {
    @State private var selectedVideo: PhotosPickerItem?
    @State private var isUploading = false
    @State private var uploadProgress: Double = 0.0
    @State private var showingVideoPicker = false
    
    var body: some View {
        VStack(spacing: 30) {
            // Upload area
            VStack(spacing: 20) {
                Image(systemName: "video.badge.plus")
                    .font(.system(size: 80))
                    .foregroundColor(.blue)
                
                Text("Video Yükle")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Anılarınızı canlandırmak için bir video seçin")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(15)
            .onTapGesture {
                showingVideoPicker = true
            }
            
            // Upload progress
            if isUploading {
                VStack(spacing: 10) {
                    ProgressView(value: uploadProgress)
                        .progressViewStyle(LinearProgressViewStyle())
                    
                    Text("Yükleniyor... \(Int(uploadProgress * 100))%")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            // Action buttons
            VStack(spacing: 15) {
                Button(action: { showingVideoPicker = true }) {
                    Label("Galeriden Seç", systemImage: "photo.on.rectangle")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: recordVideo) {
                    Label("Video Çek", systemImage: "camera.fill")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Video Yükle")
        .photosPicker(
            isPresented: $showingVideoPicker,
            selection: $selectedVideo,
            matching: .videos
        )
        .onChange(of: selectedVideo) { _, newValue in
            if newValue != nil {
                uploadVideo()
            }
        }
    }
    
    private func recordVideo() {
        // TODO: Implement camera video recording
        print("Video recording functionality to be implemented")
    }
    
    private func uploadVideo() {
        guard selectedVideo != nil else { return }
        
        // TODO: Implement actual video upload logic
        isUploading = true
        uploadProgress = 0.0
        
        // Simulate upload progress
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            uploadProgress += 0.05
            
            if uploadProgress >= 1.0 {
                timer.invalidate()
                isUploading = false
                uploadProgress = 0.0
                print("Video upload completed")
            }
        }
    }
}

#Preview {
    VideoUploadView()
}