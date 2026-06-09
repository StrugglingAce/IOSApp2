//
//  HuntListView.swift
//  iOSApp2
//
//  Created by Chibuzor Emmanuel Awanye on 2026-06-07.
//

import SwiftUI

struct HuntListView: View {
    // With @Observable, child views that need to CREATE bindings use @Bindable.
    // This is what allows $viewModel.items[index] to work below.
    @Bindable var viewModel: HuntViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Progress header
            VStack(spacing: 8) {
                Text("Items Found: \(viewModel.foundCount) / 10")
                    .font(.title2)
                    .bold()
                
                Text(viewModel.calculateReward())
                    .font(.subheadline)
                    .foregroundColor(viewModel.foundCount >= 5 ? .green : .secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                ProgressView(value: Double(viewModel.foundCount), total: 10.0)
                    .padding(.horizontal)
                    .tint(.green)
            }
            .padding()
            .background(Color(.systemBackground))
            .shadow(color: .black.opacity(0.1), radius: 5, y: 5)
            
            // List of items
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    // .indices gives us the index numbers (0, 1, 2...)
                    // so we can write $viewModel.items[index] — a live binding
                    // to the real item in the array
                    ForEach(viewModel.items.indices, id: \.self) { index in
                        NavigationLink(
                            destination: ItemDetailView(item: $viewModel.items[index])
                        ) {
                            ItemRowView(item: viewModel.items[index])
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            
            // Submit button
            NavigationLink(destination: ResultsView(viewModel: viewModel)) {
                Text(viewModel.foundCount == 10 ? "Submit Final Results" : "Submit Current Progress")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.canSubmit ? Color.blue : Color.gray)
                    .cornerRadius(12)
            }
            .padding()
            .disabled(!viewModel.canSubmit)
        }
        .navigationTitle("City Scavenger Hunt")
    }
}

// Read-only card for the list
struct ItemRowView: View {
    let item: HuntItem
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: item.isFound ? "checkmark.circle.fill" : "circle.dashed")
                .font(.title2)
                .foregroundColor(item.isFound ? .green : .gray)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.businessName)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(item.clueText)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.mint.opacity(0.15))
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(item.isFound ? Color.green : Color.mint, lineWidth: 2)
        )
    }
}

#Preview {
    NavigationStack { HuntListView(viewModel: HuntViewModel()) }
}
