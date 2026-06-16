//
//  SplashView.swift
//  iOSApp2
//
//  Created by Chibuzor Emmanuel Awanye on 2026-06-15.
//

import SwiftUI

// Each @State variable controls one part of the staged animation.
struct SplashView: View {
    @State private var logoScale: CGFloat = 0.4
    @State private var logoOpacity: Double = 0
    @State private var titleOpacity: Double = 0
    @State private var titleOffset: CGFloat = 24
    @State private var taglineOpacity: Double = 0

    var body: some View {
        ZStack {
            // Mint gradient background matching the app's theme
            LinearGradient(
                colors: [Color.mint, Color.mint.opacity(0.55)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 28) {

                // App icon — springs in first
                Image(systemName: "map.fill")
                    .font(.system(size: 90))
                    .foregroundColor(.white)
                    .scaleEffect(logoScale)
                    .opacity(logoOpacity)

                VStack(spacing: 10) {
                    // App name — slides up after the icon
                    Text("City Scavenger Hunt")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .opacity(titleOpacity)
                        .offset(y: titleOffset)

                    // Tagline — fades in last
                    Text("Explore. Discover. Earn Rewards.")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.85))
                        .opacity(taglineOpacity)
                }
            }
        }
        .onAppear {
            // Stage 1: Icon bounces in immediately
            withAnimation(.spring(duration: 0.65)) {
                logoScale = 1.0
                logoOpacity = 1.0
            }
            // Stage 2: Title slides up after icon settles
            withAnimation(.easeOut(duration: 0.5).delay(0.45)) {
                titleOpacity = 1.0
                titleOffset = 0
            }
            // Stage 3: Tagline fades in last
            withAnimation(.easeIn(duration: 0.45).delay(0.85)) {
                taglineOpacity = 1.0
            }
        }
    }
}

#Preview { SplashView() }
