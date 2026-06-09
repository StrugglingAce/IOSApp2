//
//  LoadItem.swift
//  iOSApp2
//
//  Created by Chibuzor Emmanuel Awanye on 2026-06-08.
//

import Foundation

extension HuntViewModel {
    //ai generated business names and clues i used for the hunt
    
    func loadItems() {
        items = [
            HuntItem(businessName: "The Local Indie Bookstore",
                     clueText: "Rows of pages, stories untold. Seek the shelf where the staff's favorites are sold."),
            HuntItem(businessName: "The Retro Arcade",
                     clueText: "Buttons mashing, neon lights aglow. Find the retro cabinet where the high scores show."),
            HuntItem(businessName: "The City Maker Space",
                     clueText: "Where digital models become something you can hold. Look for the machine melting plastic."),
            HuntItem(businessName: "The Rooftop Garden",
                     clueText: "High above the city streets, green life thrives where concrete meets the sky."),
            HuntItem(businessName: "The Vinyl Record Shop",
                     clueText: "Spinning stories of another era. Find the crate where the classics never fade."),
            HuntItem(businessName: "The Hidden Coffee Kiosk",
                     clueText: "Tucked in a corner, steam rising. Locals know the secret but tourists walk past."),
            HuntItem(businessName: "The Street Art Mural",
                     clueText: "Colours painted tall, a story on a wall. Find the artist's signature at the base."),
            HuntItem(businessName: "The Old Clock Tower",
                     clueText: "Time stands still for no one, but this tower has watched the city grow for a century."),
            HuntItem(businessName: "The Farmers Market Stall",
                     clueText: "Fresh from the earth, sold by the hands that grew it. Find the red-and-white striped awning."),
            HuntItem(businessName: "The Secret Courtyard",
                     clueText: "Between two buildings, hidden from the main road. A fountain whispers to those who find the narrow passage.")
        ]
    }
}
