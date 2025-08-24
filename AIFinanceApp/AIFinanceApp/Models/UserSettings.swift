import Foundation

/// Stores basic user preferences.
struct UserSettings {
    var name: String
    var currency: String
    var isDarkMode: Bool
}

extension UserSettings {
    static let `default` = UserSettings(name: "User", currency: "USD", isDarkMode: false)

    /// A predefined list of currencies supported by the app.
    static let availableCurrencies = [
        "USD", "EUR", "GBP", "JPY", "CAD", "AUD"
    ]
}
