# City Scavenger Hunt 🏙️🔍

An iOS scavenger hunt application built to promote local businesses, developed as an academic assignment for the Mobile Web Developer Using AI program at triOS College.

## 📖 About the Project
Commissioned (fictionally) by the city's Chamber of Commerce, this app encourages residents to explore their local community by visiting participating businesses. Users follow clues to find 10 specific items hidden around the city. When an item is found, the user captures a photo using the device camera to check it off their list and unlock tiered rewards.

## ✨ Features
* **10 Unique Clues:** Carefully crafted riddles pointing to various local shops (cafes, arcades, maker spaces, etc.).
* **Dynamic Progress Tracking:** A visual progress bar that updates in real-time as items are found.
* **Tiered Reward System:**
  * Find 5 items ➔ Unlock a 10% discount code.
  * Find 7 items ➔ Unlock a 20% discount code.
  * Find 10 items ➔ 20% discount + Entry into a $5,000 Grand Prize draw.

## 🛠 Technologies & Concepts Used
* **Language:** Swift
* **UI Framework:** SwiftUI
* **State Management:** `@State`, `@Binding`, and `Identifiable` data models.

## 🚀 How to Run the App
1. Clone this repository to your local machine.
2. Open the project file in Xcode.
3. Ensure you have an iOS Simulator or a physical iPhone selected as the run target.
   * *Note: To fully test the camera functionality, it is highly recommended to run the app on a physical iOS device. The iOS Simulator does not support real camera hardware.*
4. Hit `Cmd + R` or click the **Play** button to build and run.

## 📱 Usage Instructions
1. Launch the app to view the main dashboard and your current progress.
2. Tap on any of the 10 clue cards to view the riddle and the target location.
3. Once you figure out the clue and arrive at the location, Open Camera.
4. Take a clear picture of the item. Once accepted, the item will be marked as "Found!".
5. Return to the main list to see your updated progress bar.
6. Once you reach 5, 7, or 10 items, the "Submit" button will activate, allowing you to claim your rewards!

---
*Developed by Chibuzor Awanye.*
