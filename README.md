#Quest

**Description** Quest is a mobile application developed for iOS using xCode and Swift. Players can open a series of doors, which will reveal either an alien room, or treasure room, reducing their health points or obtaining treasure respectively. Players can register and login using Firebase authentication, and statistics are tracked using Firestore.

##Technologies used
- Swift/SwiftUI
- Firebase (Authentication and Storage)

## Features
- Simplistic gameplay of opening a series of doors
- User authentication and data storage through Firebase.
- Real-time data retrieval and storage of player statistics
- Localization support for English and French
- Follows Model-View-Controller (MVC) architectural principles for code organization and maintainability

## Running the project
To run this project on your machine, please follow these steps. 
Note: You must install xCode on a Macbook in addition to having a Firebase account prior to starting
1. **Clone Repository**
   - Clone this repository to your machine
     
1. **Create a Firebase Project**:
   - Go to the [Firebase Console](https://console.firebase.google.com/) and create a new project
   - Within the project that was created, create a new App for iOS
   - The app bundle ID is leejorda.sheridancollege.Quest

2. **Generate GoogleService-Info.plist**:
   - Click 'Register App' from the previous step
   - Download the `GoogleService-Info.plist` file and add it to the root project folder (Quest)
     
3. **Configure Firebase Authentication**:
   - In the same Firebase project, setup authentication for email/password
