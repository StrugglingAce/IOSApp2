//
//  ContentView.swift
//  iOSApp2
//
//  Created by Chibuzor Emmanuel Awanye on 2026-06-07.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = HuntViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                
                Image(systemName: "map.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.mint)
                    .padding(.top, 40)
                
                VStack(spacing: 8) {
                    Text("City Scavenger Hunt")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    Text("Explore the city, find hidden gems,\nand earn amazing rewards!")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }
                
                if viewModel.foundCount > 0 {
                    VStack(spacing: 8) {
                        Text("Your Progress")
                            .font(.headline)
                        Text("\(viewModel.foundCount) / 10 Items Found")
                            .font(.title3)
                            .foregroundColor(.mint)
                        ProgressView(value: Double(viewModel.foundCount), total: 10.0)
                            .tint(.mint)
                            .padding(.horizontal)
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(16)
                }
                
                NavigationLink(destination: HuntListView(viewModel: viewModel)) {
                    HStack {
                        Image(systemName: "figure.walk")
                        Text(viewModel.foundCount > 0 ? "Continue Hunt" : "Start Hunt")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.mint)
                    .cornerRadius(12)
                }
                
                NavigationLink(destination: ResultsView(viewModel: viewModel)) {
                    HStack {
                        Image(systemName: "chart.bar.fill")
                        Text("View Progress & Rewards")
                    }
                    .font(.headline)
                    .foregroundColor(.mint)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.mint.opacity(0.15))
                    .cornerRadius(12)
                }
                
                Spacer()
            }
            .padding(.horizontal, 24)
            .navigationBarHidden(true)
        }
    }
}

#Preview { ContentView() }
