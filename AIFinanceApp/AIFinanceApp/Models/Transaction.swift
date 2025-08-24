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
    static let sample: [Transaction] = []
}
