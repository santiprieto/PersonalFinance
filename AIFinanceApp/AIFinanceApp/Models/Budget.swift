import Foundation

/// Represents a monthly budget for a specific category.
struct Budget: Identifiable, Hashable {
    let id: UUID
    var category: String
    var limit: Double
    var spent: Double
}

extension Budget {
    /// Sample budgets for previews and prototyping.
    static let sample: [Budget] = [
        Budget(id: UUID(), category: "Food", limit: 500, spent: 150),
        Budget(id: UUID(), category: "Rent", limit: 1_000, spent: 1_000),
        Budget(id: UUID(), category: "Entertainment", limit: 200, spent: 50)
    ]
}
