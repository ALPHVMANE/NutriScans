# 🧃 NutriScans
NutriScans is a SwiftUI-based iOS application designed to help users quickly access nutritional information about food products by scanning their barcodes. The app utilizes the device's camera to read barcodes and fetches product data from the Open Food Facts database. It also features a complete user authentication system powered by Firebase.

## Features

- **Barcode Scanning**: Scan EAN-13, EAN-8, UPC-E, and other common barcode formats using the device's camera.
- **Product Information**: View detailed product information, including product name, images, ingredients, and nutritional data retrieved from the Open Food Facts API.
- **User Authentication**: Securely register, log in, and log out with Firebase Authentication.
- **Home Feed**: An ambient video background on the home screen for a visually appealing welcome.

## Technology Stack

- **Frontend**: <a href="#"><img alt="Swift" src="https://img.shields.io/badge/Swift%20|%20SwiftUI-F05138?logo=swift&logoColor=white"></a>
- **Backend & Authentication**: <a href="#"><img alt="Firebase" src ="https://img.shields.io/badge/Firebase-EB844E.svg?logo=firebase&logoColor=white"></a>

- **Data Source**: [Open Food Facts API](https://world.openfoodfacts.net/)
- **Core Frameworks**: AVFoundation, Vision for camera and barcode detection.
- **Dependencies**:
    - `firebase-ios-sdk`: For user authentication and database services.
    - `openfoodfacts-swift`: A Swift package for interfacing with the Open Food Facts API.

## Project Structure

The project is organized into a clean, easy-to-navigate structure following standard iOS development patterns.

- `NutriScans/Views/`: Contains all the SwiftUI views that make up the user interface.
  - `CameraView.swift`: The main view for scanning barcodes.
  - `AuthGate.swift`, `LoginView.swift`, `RegisterView.swift`: Handle user authentication flow.
  - `ProfileView.swift`: Displays and manages user profile data.
  - `HomeView.swift`: The application's home screen.
  - `TabScreen.swift`: The main tab navigator for the app.
- `NutriScans/Model/`: Includes data models and view models.
  - `ResponseModel.swift`, `FoodItem.swift`: Codable structs for parsing API responses.
  - `ItemViewModel.swift`: An `ObservableObject` that fetches and holds product data.
  - `ScannerView.swift`: A `UIViewControllerRepresentable` that wraps the AVFoundation and Vision-based barcode scanner.
  - `AppUser.swift`: The model for application users stored in Firestore.
- `NutriScans/Service/`: Contains services that handle business logic.
  - `AuthService.swift`: A singleton class to manage all Firebase authentication and user profile operations.
  - `WebService.swift`: A generic helper for making network requests to APIs.
- `NutriScans/Assets.xcassets/`: All application assets, including the app icon, images, and color sets.
- `NutriScans/Fonts/`: Custom fonts used throughout the app.

## 📥 Setup and Installation

To run this project locally, you will need Xcode and a configured Apple Developer account.

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/alphvmane/nutriscans.git
    cd nutriscans
    ```
2.  **Open the project in Xcode:**
    Open the `NutriScans.xcodeproj` file in Xcode. Ensure that the project has the required dependencies by looking at the package settings.

3.  **Firebase Configuration:**
    The project includes a `GoogleService-Info.plist` file. To connect the app to your own Firebase backend, you must:
    - Create a new project on the [Firebase Console](https://console.firebase.google.com/).
    - Add an iOS app to your Firebase project, ensuring the Bundle ID matches the one in the Xcode project (`download.NutriScans` or your own).
    - Download your own `GoogleService-Info.plist` file from the Firebase project settings.
    - Replace the existing `GoogleService-Info.plist` in the `NutriScans/` directory with the one you downloaded.
    - In the Firebase Console, enable **Authentication** (with Email/Password) and **Firestore**.

4.  **Build and Run:**
    Select a target device or simulator in Xcode and run the application.

    
### NutriScans Previews

|      |      |      |
|------|------|------|
|![Screenshot1](./readme/HomePage.PNG)|![Screenshot2](./readme.DisplayPage.PNG)|![Screenshot3](./readme/AddProduct.PNG)|

|      |      |      |
|------|------|------|
|![Screenshot4](./readme/Login.PNG)|![Screenshot6](./readme/Profile.PNG)|![Screenshot7](./readme/Register.PNG)|
