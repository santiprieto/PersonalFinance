import Foundation

/// Exposes user preference data to the settings interface.
final class SettingsViewModel: ObservableObject {
    @Published var userSettings: UserSettings

    init(userSettings: UserSettings = .default) {
        self.userSettings = userSettings
    }
}
