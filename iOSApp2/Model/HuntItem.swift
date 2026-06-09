//
//  HuntItem.swift
//  iOSApp2
//
//  Created by Chibuzor Emmanuel Awanye on 2026-06-07.
//

import Foundation

// Stores all data for a single scavenger hunt item
struct HuntItem: Identifiable {
    var id = UUID()
    let businessName: String
    let clueText: String
    var isFound: Bool = false
    // Store as raw bytes (Data) so we don't need UIKit in the model
    var imageData: Data? = nil
}
