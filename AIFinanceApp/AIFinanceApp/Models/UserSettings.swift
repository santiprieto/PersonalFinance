import Foundation

/// Stores basic user preferences.
struct UserSettings {
    var name: String
    var currency: String
    var isDarkMode: Bool
}

extension UserSettings {
    static let `default` = UserSettings(name: "User", currency: "USD", isDarkMode: false)
}
