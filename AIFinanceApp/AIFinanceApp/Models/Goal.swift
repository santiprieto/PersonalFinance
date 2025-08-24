import Foundation

/// Represents a savings goal.
struct Goal: Identifiable, Hashable {
    let id: UUID
    var title: String
    var targetAmount: Double
    var currentAmount: Double
    var dueDate: Date
}

extension Goal {
    static let sample: [Goal] = []
}
