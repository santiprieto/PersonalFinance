import Foundation

/// Represents a monthly budget for a specific category.
struct Budget: Identifiable, Hashable {
    let id: UUID
    var category: String
    var limit: Double
    var spent: Double
}

extension Budget {
    static let sample: [Budget] = []
}
