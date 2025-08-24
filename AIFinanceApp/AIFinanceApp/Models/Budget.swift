import Foundation

/// Represents a monthly budget for a specific category.
struct Budget: Identifiable, Hashable {
    let id: UUID
    var category: String
    var limit: Double
    var spent: Double
}

extension Budget {
    static let sample: [Budget] = [
        Budget(id: UUID(), category: "Dining", limit: 200, spent: 45),
        Budget(id: UUID(), category: "Groceries", limit: 500, spent: 120),
        Budget(id: UUID(), category: "Entertainment", limit: 150, spent: 60)
    ]
}
