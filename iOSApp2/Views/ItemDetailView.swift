//
//  ItemDetailView.swift
//  iOSApp2
//
//  Created by Chibuzor Emmanuel Awanye on 2026-06-07.
//

import SwiftUI
import PhotosUI

struct ItemDetailView: View {
    @Binding var item: HuntItem
    
    // PhotosPickerItem is SwiftUI's way to let the user pick from their library
    @State private var selectedPhoto: PhotosPickerItem? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                // Clue card
                VStack(spacing: 12) {
                    Text(item.businessName)
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    Divider()
                    
                    Text("🔍 Your Clue")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(item.clueText)
                        .font(.body)
                        .italic()
                        .multilineTextAlignment(.center)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(16)
                
                // Photo area
                if item.isFound, let data = item.imageData {
                    
                    // --- FOUND: show the saved photo ---
                    // Note: UIImage(data:) is the one unavoidable iOS bridge
                    // to display saved photo bytes as a SwiftUI Image
                    if let uiImage = UIImage(data: data) {
                        VStack(spacing: 12) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 280)
                                .frame(maxWidth: .infinity)
                                .clipped()
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.green, lineWidth: 3)
                                )
                            
                            Text("✅ Item Found!")
                                .font(.headline)
                                .foregroundColor(.green)
                            
                            // Allow swapping the photo
                            PhotosPicker(selection: $selectedPhoto, matching: .images) {
                                Text("Change Photo")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    
                } else {
                    
                    // --- NOT YET FOUND ---
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(style: StrokeStyle(lineWidth: 3, dash: [8]))
                            .foregroundColor(.gray.opacity(0.4))
                            .frame(height: 240)
                        
                        VStack(spacing: 12) {
                            Image(systemName: "viewfinder")
                                .font(.system(size: 48))
                                .foregroundColor(.gray)
                            Text("Take a photo to mark this item found")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                    }
                    
                    // PhotosPicker opens the system photo library (including Camera Roll).
                    // On a real device, the user can take a photo with the Camera app
                    // first, then select it here. On simulator, sample photos appear.
                    PhotosPicker(selection: $selectedPhoto, matching: .images) {
                        HStack {
                            Image(systemName: "photo.on.rectangle")
                            Text("Choose / Take Photo")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.mint)
                        .cornerRadius(12)
                    }
                }
                
                Spacer(minLength: 40)
            }
            .padding()
        }
        .navigationTitle("Clue Details")
        .navigationBarTitleDisplayMode(.inline)
        // When user picks a photo from the library, load it as raw Data
        .onChange(of: selectedPhoto) { _, newPhoto in
            Task {
                if let data = try? await newPhoto?.loadTransferable(type: Data.self) {
                    item.imageData = data   // Save to the model
                    item.isFound = true     // Mark as found
                }
            }
        }
    }
}
