import Foundation
import Combine

/// Global app state driving onboarding and subscription flow.
final class AppViewModel: ObservableObject {
    @Published var userSettings: UserSettings = .default
    @Published var isAuthenticated: Bool = false
    @Published var isOnboarded: Bool = false
    @Published var isSubscribed: Bool = false

    // Sample balance derived from transactions
    @Published private(set) var balance: Double = 0

    private var cancellables = Set<AnyCancellable>()
    private let authService = AuthService()

    init() {
        calculateBalance()
    }

    func completeOnboarding(name: String, currency: String) {
        userSettings.name = name
        userSettings.currency = currency
        isOnboarded = true
    }

    func subscribe() {
        isSubscribed = true
    }

    @discardableResult
    func login(username: String, password: String) -> Bool {
        let success = authService.login(username: username, password: password)
        isAuthenticated = success
        return success
    }

    @discardableResult
    func createUser(username: String, password: String) -> Bool {
        let success = authService.createUser(username: username, password: password)
        isAuthenticated = success
        return success
    }

    func logout() {
        authService.logout()
        isAuthenticated = false
        isOnboarded = false
    }

    /// Calculates the total balance from sample data.
    func calculateBalance() {
        balance = SampleData.transactions.reduce(0) { $0 + $1.amount }
    }
}
