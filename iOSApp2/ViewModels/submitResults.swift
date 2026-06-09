//
//  submitResults.swift
//  iOSApp2
//
//  Created by Chibuzor Emmanuel Awanye on 2026-06-08.
//

import Foundation

extension HuntViewModel {
    
    func submitResults() {
        print("--- Hunt Results Submitted ---")
        print("Items Found: \(foundCount) / 10")
        print("Reward: \(calculateReward())")
    }
}
