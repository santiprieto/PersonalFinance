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
        Transaction(
            id: UUID(),
            merchant: "Coffee Shop",
            category: "Dining",
            amount: -4.50,
            date: Date().addingTimeInterval(-86_400),
            tags: ["coffee"]
        ),
        Transaction(
            id: UUID(),
            merchant: "Salary",
            category: "Income",
            amount: 2_500.00,
            date: Date().addingTimeInterval(-604_800),
            tags: []
        ),
        Transaction(
            id: UUID(),
            merchant: "Grocery Store",
            category: "Food",
            amount: -76.23,
            date: Date().addingTimeInterval(-259_200),
            tags: ["groceries"]
        )
    ]
}
