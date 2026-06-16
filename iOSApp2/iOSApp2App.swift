//
//  iOSApp2App.swift
//  iOSApp2
//
//  Created by Chibuzor Emmanuel Awanye on 2026-06-07.
//

import SwiftUI

@main
struct iOSApp2App: App {
    @State private var isShowingSplash = true

    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()

                if isShowingSplash {
                    SplashView()
                        .transition(.opacity)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.6) {
                    withAnimation(.easeOut(duration: 0.6)) {
                        isShowingSplash = false
                    }
                }
            }
        }
    }
}
