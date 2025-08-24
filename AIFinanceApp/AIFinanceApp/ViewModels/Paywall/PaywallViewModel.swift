import Foundation

/// Coordinates subscription actions from the paywall interface.
final class PaywallViewModel: ObservableObject {
    private let appViewModel: AppViewModel

    init(appViewModel: AppViewModel) {
        self.appViewModel = appViewModel
    }

    func subscribeMonthly() {
        // Placeholder subscription logic
        appViewModel.subscribe()
    }

    func subscribeAnnually() {
        // Placeholder subscription logic
        appViewModel.subscribe()
    }
}
