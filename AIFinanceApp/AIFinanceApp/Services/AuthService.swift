import Foundation

/// Simple in-memory authentication service.
final class AuthService {
    private var users: [String: String] = [:] // username: password
    private(set) var currentUser: String?

    func createUser(username: String, password: String) -> Bool {
        guard users[username] == nil else { return false }
        users[username] = password
        currentUser = username
        return true
    }

    func login(username: String, password: String) -> Bool {
        guard users[username] == password else { return false }
        currentUser = username
        return true
    }

    func logout() {
        currentUser = nil
    }
}
