import Foundation

/// Represents a financial transaction.
struct Transaction: Identifiable, Hashable {
    let id: UUID
    var merchant: String
    var category: String
    var amount: Double
    var date: Date
    var tags: [String]
}

extension Transaction {
    /// Sample transactions for previews and prototyping.
    static let sample: [Transaction] = [
        Transaction(id: UUID(), merchant: "Coffee Shop", category: "Dining", amount: 4.99, date: .now, tags: ["coffee"]),
        Transaction(id: UUID(), merchant: "Grocery Store", category: "Groceries", amount: 82.30, date: .now.addingTimeInterval(-86400), tags: ["food"]),
        Transaction(id: UUID(), merchant: "Movie Theater", category: "Entertainment", amount: 15.00, date: .now.addingTimeInterval(-172800), tags: ["fun"])
    ]
}
