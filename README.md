# CrypticApp

CrypticApp is a sophisticated demonstration application built with Swift that showcases secure string encryption and storage capabilities. By leveraging Apple's CryptoKit framework alongside modern SwiftUI and SwiftData, this app illustrates best practices for handling sensitive data such as API keys or URLs through AES-GCM encryption.

## 🔑 Key Features

### Robust Encryption
- Implements AES-GCM encryption using Apple's CryptoKit framework
- Generates secure symmetric keys for each encrypted string
- Produces Base64-encoded ciphertext for easy storage and transmission
- Ensures data integrity through authenticated encryption

### Modern Data Management
- Utilizes SwiftData for efficient local data persistence
- Maintains comprehensive records including original text, encrypted data, and timestamps
- Implements proper data modeling practices for secure storage

### Elegant User Interface
- Built entirely with SwiftUI for a native Apple platforms experience
- Provides an intuitive list/detail interface for managing encrypted items
- Features convenient copy functionality for all fields
- Supports both light and dark mode

### Cross-Platform Support
- Compatible with iOS and macOS (via Mac Catalyst)
- Implements platform-specific optimizations
- Maintains consistent user experience across devices


## 📲 Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/CrypticApp.git
cd CrypticApp
```

2. Open the project in Xcode:
```bash
open CrypticApp.xcodeproj
```

3. Build and run the application using Xcode's run button or press `⌘ + R`


## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Apple's CryptoKit framework documentation
- SwiftUI and SwiftData development teams
- The Swift community for their invaluable feedback and contributions

