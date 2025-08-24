# AIFinanceApp

A sample personal finance application built with **SwiftUI** and the **MVVM** pattern. The app demonstrates a scalable, testable architecture and modern iOS design practices.

## Features
- Track transactions, budgets, and savings goals
- AI-generated weekly spending insights
- Onboarding flow, subscription paywall, and settings
- Sample data and previews for rapid prototyping
- Extensive documentation comments compatible with Xcode Quick Help

## Requirements
- Xcode 15 or later
- iOS 17 SDK
- Swift 5.9+

## Getting Started
1. Clone the repository.
   ```bash
   git clone https://github.com/yourusername/PersonalFinance.git
   ```
2. Open `AIFinanceApp/AIFinanceApp.xcodeproj` in Xcode.
3. Run the **AIFinanceApp** scheme on an iOS 17 simulator or device.

The interface adheres to Apple's [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/).

## Project Structure
```
AIFinanceApp/
├── Data          # Sample seed data
├── Models        # Transaction, Budget, Goal, UserSettings
├── Services      # AI insights, authentication & persistence
├── ViewModels    # ObservableObject view models
└── Views         # SwiftUI screens
```

## Running Tests
Use **⌘U** in Xcode or run:

```bash
xcodebuild test -scheme AIFinanceApp -destination 'platform=iOS Simulator,name=iPhone 15'
```

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request.

---

This project is intended for educational purposes and is not a production-ready finance tool.
