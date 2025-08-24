import Foundation

final class OnboardingViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var currency: String = "USD"

    private let appViewModel: AppViewModel

    init(appViewModel: AppViewModel) {
        self.appViewModel = appViewModel
    }

    func finish() {
        appViewModel.completeOnboarding(name: name.isEmpty ? "User" : name, currency: currency)
    }
}
