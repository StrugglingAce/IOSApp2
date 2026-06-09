//
//  ResultsView.swift
//  iOSApp2
//
//  Created by Chibuzor Emmanuel Awanye on 2026-06-07.
//

import SwiftUI

struct ResultsView: View {
    var viewModel: HuntViewModel
    
    @State private var showingSubmitAlert = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                Image(systemName: viewModel.foundCount == 10 ? "trophy.fill" : "star.fill")
                    .font(.system(size: 64))
                    .foregroundColor(viewModel.foundCount == 10 ? .yellow : .mint)
                    .padding(.top)
                
                VStack(spacing: 8) {
                    Text("Items Found")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text("\(viewModel.foundCount) / 10")
                        .font(.system(size: 52, weight: .bold))
                    ProgressView(value: Double(viewModel.foundCount), total: 10.0)
                        .tint(.mint)
                        .padding(.horizontal)
                }
                
                // Reward card
                VStack(spacing: 16) {
                    Text("Your Reward")
                        .font(.headline)
                    
                    Text(viewModel.calculateReward())
                        .font(.title3)
                        .bold()
                        .foregroundColor(viewModel.hasReward ? .green : .secondary)
                        .multilineTextAlignment(.center)
                    
                    if viewModel.hasReward {
                        Divider()
                        VStack(alignment: .leading, spacing: 10) {
                            if viewModel.foundCount >= 5 {
                                Label("10% Discount Earned", systemImage: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                            if viewModel.foundCount >= 7 {
                                Label("20% Discount Earned", systemImage: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                            if viewModel.foundCount == 10 {
                                Label("Grand Prize Entry ($5,000)!", systemImage: "star.circle.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.subheadline)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(16)
                
                // Item checklist
                VStack(alignment: .leading, spacing: 0) {
                    Text("Hunt Summary")
                        .font(.headline)
                        .padding(.horizontal)
                        .padding(.bottom, 12)
                    
                    ForEach(viewModel.items) { item in
                        HStack {
                            Image(systemName: item.isFound ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(item.isFound ? .green : .gray)
                            Text(item.businessName)
                                .font(.subheadline)
                            Spacer()
                            Text(item.isFound ? "Found ✓" : "Not found")
                                .font(.caption)
                                .foregroundColor(item.isFound ? .green : .secondary)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        if item.id != viewModel.items.last?.id {
                            Divider().padding(.horizontal)
                        }
                    }
                }
                .background(Color(.secondarySystemBackground))
                .cornerRadius(16)
                
                // Submit button
                Button(action: {
                    viewModel.submitResults()
                    showingSubmitAlert = true
                }) {
                    Text(viewModel.foundCount == 10 ? "🎉 Submit Final Results" : "Submit Current Progress")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.canSubmit ? Color.blue : Color.gray)
                        .cornerRadius(12)
                }
                .disabled(!viewModel.canSubmit)
                .alert("Results Submitted!", isPresented: $showingSubmitAlert) {
                    Button("OK", role: .cancel) {}
                } message: {
                    Text("Reward: \(viewModel.calculateReward())")
                }
            }
            .padding()
        }
        .navigationTitle("Results")
    }
}

#Preview {
    NavigationStack { ResultsView(viewModel: HuntViewModel()) }
}
