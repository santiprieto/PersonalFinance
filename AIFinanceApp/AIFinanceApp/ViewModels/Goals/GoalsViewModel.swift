import Foundation

/// Manages savings goals and updates progress toward each goal.
final class GoalsViewModel: ObservableObject {
    @Published var goals: [Goal] = SampleData.goals

    func update(goal: Goal) {
        if let index = goals.firstIndex(where: { $0.id == goal.id }) {
            goals[index] = goal
        }
    }

    func add(title: String, targetAmount: Double, dueDate: Date) {
        let goal = Goal(id: UUID(), title: title, targetAmount: targetAmount, currentAmount: 0, dueDate: dueDate)
        goals.append(goal)
    }
}
