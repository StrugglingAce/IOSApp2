//
//  calculateResult.swift
//  iOSApp2
//
//  Created by Chibuzor Emmanuel Awanye on 2026-06-08.
//

import Foundation

extension HuntViewModel {
    
    var foundCount: Int {
        items.filter { $0.isFound }.count
    }
    
    //finds out if we have minimum reward
    var hasReward: Bool { foundCount >= 5 }
    var canSubmit: Bool { foundCount >= 5 }
    
    func calculateReward() -> String {
        switch foundCount {
        case 10:   return "🏆 20% Discount + Grand Prize Entry ($5,000)!"
        case 7...9: return "🎉 20% Discount Unlocked!"
        case 5...6: return "✨ 10% Discount Unlocked!"
        default:   return "Find 5 items to unlock your first reward!"
        }
    }
}
