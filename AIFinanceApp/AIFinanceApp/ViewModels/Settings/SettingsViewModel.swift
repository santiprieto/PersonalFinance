import Foundation

final class SettingsViewModel: ObservableObject {
    @Published var userSettings: UserSettings

    init(userSettings: UserSettings = .default) {
        self.userSettings = userSettings
    }
}
