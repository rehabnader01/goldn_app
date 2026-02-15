# 🥇 Goldn - Real-Time Precious Metals Price Tracker

A clean and modern Flutter application that provides real-time gold and silver spot prices using the Metals.dev API. Built with Clean Architecture principles and BLoC state management for a scalable and maintainable codebase.

![Flutter](https://img.shields.io/badge/Flutter-v3.9.2+-02569B?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.9.2+-0175C2?style=for-the-badge&logo=dart)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Architecture](#-architecture)
- [Folder Structure](#-folder-structure)
- [Getting Started](#-getting-started)
- [Testing](#-testing)
- [Screenshots](#-screenshots)
- [Future Improvements](#-future-improvements)
- [Contributing](#-contributing)
- [License](#-license)
- [Connect With Me](#-connect-with-me)

## 🌟 Overview

**Goldn** is a Flutter application that allows users to track real-time precious metal prices with a sleek, minimalist interface. The app fetches live gold and silver spot prices from the Metals.dev API and displays them in an elegant, easy-to-read format.

Perfect for investors, traders, or anyone interested in tracking precious metal market prices on the go!

## ✨ Features

- 📊 **Real-time Price Tracking** - Get up-to-the-minute gold and silver spot prices
- 🎨 **Clean UI/UX** - Minimalist black background with gold and silver themed screens
- 🔄 **Pull to Refresh** - Easy retry mechanism for failed API calls
- ⚡ **Fast & Responsive** - Built with Flutter for smooth 60fps performance
- 🏗️ **Clean Architecture** - Separation of concerns with layers (presentation, domain, data)
- 🧩 **BLoC Pattern** - Predictable state management using flutter_bloc
- 🌐 **RESTful API Integration** - Dio for efficient HTTP requests
- ❌ **Error Handling** - Graceful error states with retry functionality

## 🛠️ Tech Stack

### Core Technologies
- **Flutter** - UI framework for cross-platform development
- **Dart** - Programming language (v3.9.2+)

### State Management
- **flutter_bloc** (v9.1.1) - Business Logic Component pattern
- **bloc** (v9.2.0) - Core BLoC library

### Networking
- **dio** (v5.9.1) - Powerful HTTP client for Dart
- **pretty_dio_logger** (v1.4.0) - Network request logging

### Functional Programming
- **dartz** (v0.10.1) - Functional programming (Either for error handling)

### UI Components
- **cupertino_icons** (v1.0.8) - iOS-style icons

### Development Tools
- **flutter_lints** (v5.0.0) - Recommended lints for Flutter
- **flutter_test** - Testing framework

## 🏛️ Architecture

This project follows **Clean Architecture** principles combined with **BLoC pattern** for scalable and testable code:

```
lib/
├── core/                          # Shared resources
│   ├── constants/                 # App-wide constants
│   │   ├── app_colors.dart       # Color palette
│   │   ├── app_images.dart       # Image asset paths
│   │   └── app_strings.dart      # String constants
│   ├── networking/                # Network layer
│   │   ├── api_constants.dart    # API endpoints & keys
│   │   └── dio_helper.dart       # HTTP client setup
│   ├── presentation/              # Shared screens
│   │   └── home_screen.dart      # Main navigation screen
│   ├── routing/                   # Navigation
│   │   ├── app_router.dart       # Route generation
│   │   └── routes.dart           # Route constants
│   └── widgets/                   # Reusable widgets
│       ├── custom_app_bar_widget.dart
│       ├── custom_button.dart
│       └── custom_text_form_field.dart
│
├── features/                      # Feature modules
│   ├── model/                     # Shared data models
│   │   └── metal_model.dart      # Metal price model
│   ├── gold/                      # Gold feature
│   │   ├── data/
│   │   │   └── repo/
│   │   │       └── gold_repo.dart         # Gold data repository
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── gold_cubit.dart       # Gold business logic
│   │       │   └── gold_states.dart      # Gold state definitions
│   │       └── screens/
│   │           └── gold_screen.dart      # Gold price UI
│   ├── silver/                    # Silver feature
│   │   ├── data/
│   │   │   └── repo/
│   │   │       └── silver_repo.dart      # Silver data repository
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── silver_cubit.dart    # Silver business logic
│   │       │   └── silver_states.dart   # Silver state definitions
│   │       └── screens/
│   │           └── silver_screen.dart   # Silver price UI
│   └── widgets/                   # Feature-specific widgets
│       ├── custom_metal_image.dart      # Metal image display
│       └── custom_price_display.dart    # Price formatter
│
└── main.dart                      # App entry point
```

### Architecture Layers

1. **Presentation Layer** (UI + State Management)
   - Screens, Widgets, Cubit/BLoC
   - Handles user interactions and UI updates

2. **Domain Layer** (Business Logic)
   - Use cases and business rules
   - Independent of UI and data sources

3. **Data Layer** (Repositories)
   - API calls, data parsing
   - Error handling with Either type (dartz)

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:
- Flutter SDK (v3.9.2 or higher)
- Dart SDK (v3.9.2 or higher)
- Android Studio / Xcode (for mobile development)
- VS Code or your preferred IDE

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/goldn.git
   cd goldn
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Verify Flutter setup**
   ```bash
   flutter doctor
   ```

4. **Run the app**
   ```bash
   # Run on connected device/emulator
   flutter run

   # Run on specific platform
   flutter run -d chrome        # Web
   flutter run -d windows       # Windows
   flutter run -d macos         # macOS
   ```

### API Configuration

The app uses the [Metals.dev API](https://metals.dev/) for fetching real-time prices. The API key is configured in:

```dart
// lib/core/networking/api_constants.dart
class ApiConstants {
  static const String baseUrl = 'https://api.metals.dev/v1/';
  static const String apiKey = 'YOUR_API_KEY_HERE';
}
```

**Note:** The current API key in the code is for demonstration purposes. For production use, obtain your own API key from [metals.dev](https://metals.dev/).

## 🧪 Testing

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/widget_test.dart
```

### Test Structure

```
test/
└── widget_test.dart    # Widget tests (template included)
```

**Note:** The project currently includes basic widget test templates. Comprehensive unit tests for repositories, cubits, and widgets should be added for production-ready code.

## 📸 Screenshots

> **Note:** Add your app screenshots here once available

| Home Screen | Gold Price | Silver Price |
|------------|------------|--------------|
| ![Home](screenshots/home.png) | ![Gold](screenshots/gold.png) | ![Silver](screenshots/silver.png) |

**To add screenshots:**
1. Create a `screenshots/` folder in the root directory
2. Add your app screenshots
3. Update the paths above

## 🔮 Future Improvements

Here are some planned enhancements for future versions:

### High Priority
- [ ] **Historical Price Charts** - Add interactive price history graphs using fl_chart
- [ ] **Price Alerts** - Push notifications when metals reach target prices
- [ ] **Multi-currency Support** - Display prices in different currencies (EUR, GBP, etc.)
- [ ] **Dark/Light Theme** - Theme switcher for user preference
- [ ] **Offline Mode** - Cache last fetched prices for offline viewing

### Medium Priority
- [ ] **More Metals** - Add platinum, palladium, and other precious metals
- [ ] **Price Comparison** - Compare current prices with historical averages
- [ ] **Share Feature** - Share price screenshots on social media
- [ ] **Unit Tests** - Comprehensive test coverage (>80%)
- [ ] **CI/CD Pipeline** - Automated testing and deployment

### Low Priority
- [ ] **Animations** - Smooth transitions and loading animations
- [ ] **Onboarding** - Welcome tutorial for first-time users
- [ ] **Settings Screen** - Customize app preferences
- [ ] **Localization** - Multi-language support (i18n)
- [ ] **Desktop Optimization** - Better UI for large screens

## 🤝 Contributing

Contributions are always welcome! Here's how you can help:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit your changes** (`git commit -m 'Add some AmazingFeature'`)
4. **Push to the branch** (`git push origin feature/AmazingFeature`)
5. **Open a Pull Request**

### Contribution Guidelines
- Follow the existing code style and architecture
- Write meaningful commit messages
- Add tests for new features
- Update documentation as needed
- Ensure all tests pass before submitting PR

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Connect With Me

<div align="center">

[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/rehabnader01)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/rehabnader01)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](rehab.nader.01@gmail.com)

</div>

---

<div align="center">

**⭐ If you found this project helpful, please give it a star! ⭐**

Made with ❤️ using Flutter

</div>
