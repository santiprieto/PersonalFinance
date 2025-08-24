import Foundation
import SwiftUI

/// Handles user login and account creation.
final class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String?

    private let appViewModel: AppViewModel

    init(appViewModel: AppViewModel) {
        self.appViewModel = appViewModel
    }

    func login() {
        guard appViewModel.login(username: username, password: password) else {
            errorMessage = "Invalid credentials"
            return
        }
    }

    func createUser() {
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match"
            return
        }
        guard appViewModel.createUser(username: username, password: password) else {
            errorMessage = "User already exists"
            return
        }
    }
}
