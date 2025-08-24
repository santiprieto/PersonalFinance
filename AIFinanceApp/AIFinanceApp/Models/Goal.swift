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
    static let sample: [Goal] = [
        Goal(id: UUID(), title: "Vacation", targetAmount: 1000, currentAmount: 250, dueDate: .now.addingTimeInterval(60*60*24*90)),
        Goal(id: UUID(), title: "New Laptop", targetAmount: 1500, currentAmount: 300, dueDate: .now.addingTimeInterval(60*60*24*180))
    ]
}
