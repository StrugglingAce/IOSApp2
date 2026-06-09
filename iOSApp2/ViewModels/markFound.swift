//
//  markFound.swift
//  iOSApp2
//
//  Created by Chibuzor Emmanuel Awanye on 2026-06-08.
//

import Foundation

extension HuntViewModel {
    
    // Marks an item as found and saves its photo as raw data
    func markFound(itemID: UUID, photoData: Data?) {
        if let index = items.firstIndex(where: { $0.id == itemID }) {
            items[index].isFound = true
            items[index].imageData = photoData
        }
    }
}
