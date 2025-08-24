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
    /// Sample goals for previews and prototyping.
    static let sample: [Goal] = [
        Goal(
            id: UUID(),
            title: "Vacation Fund",
            targetAmount: 1_200,
            currentAmount: 400,
            dueDate: Date().addingTimeInterval(86_400 * 120)
        ),
        Goal(
            id: UUID(),
            title: "Emergency Fund",
            targetAmount: 5_000,
            currentAmount: 1_500,
            dueDate: Date().addingTimeInterval(86_400 * 365)
        ),
        Goal(
            id: UUID(),
            title: "New Laptop",
            targetAmount: 1_500,
            currentAmount: 300,
            dueDate: Date().addingTimeInterval(86_400 * 200)
        )
    ]
}
