import Foundation

final class GoalsViewModel: ObservableObject {
    @Published var goals: [Goal] = SampleData.goals

    func update(goal: Goal) {
        if let index = goals.firstIndex(where: { $0.id == goal.id }) {
            goals[index] = goal
        }
    }
}
