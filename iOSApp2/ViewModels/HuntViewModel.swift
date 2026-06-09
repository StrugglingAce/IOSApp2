//
//  HuntViewModel.swift
//  iOSApp2
//
//  Created by Chibuzor Emmanuel Awanye on 2026-06-08.
//

import SwiftUI

@Observable
//the model for the list of hunt items
class HuntViewModel {
    var items: [HuntItem] = []
    
    init() {
        loadItems()
    }
}
