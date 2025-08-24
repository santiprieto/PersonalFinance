# AIFinanceApp

A sample personal finance application built with **SwiftUI** and the **MVVM** pattern. The project demonstrates clean architecture and follows Apple's documentation conventions using Swift-style `///` comments for inline guidance.

## Features
- Track transactions, budgets, and savings goals.
- AI-generated weekly spending insights.
- Onboarding, subscription paywall, and settings flows.
- Modernized onboarding experience inspired by the latest iOS app patterns from [Mobbin](https://mobbin.com/discover/apps/ios/latest).

## Architecture
Designed for scalability, each screen is backed by a dedicated `ObservableObject` view model. Documentation comments are provided for public types and methods so Xcode's Quick Help offers context while developing.

## Getting Started
1. Open `AIFinanceApp/AIFinanceApp.xcodeproj` with Xcode 15 or later.
2. Run the **AIFinanceApp** scheme on an iOS 17 simulator or device.

The interface and behavior are intended to align with [Apple's Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/).
