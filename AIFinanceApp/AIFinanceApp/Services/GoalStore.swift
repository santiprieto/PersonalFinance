import Foundation

/// Actor responsible for managing goal data asynchronously.
actor GoalStore {
    static let shared = GoalStore()

    private var goals: [Goal] = SampleData.goals

    private init() {}

    func fetchGoals() -> [Goal] {
        goals
    }

    func add(_ goal: Goal) async {
        goals.append(goal)
    }

    func update(_ goal: Goal) async {
        if let index = goals.firstIndex(where: { $0.id == goal.id }) {
            goals[index] = goal
        }
    }

    func delete(_ goal: Goal) async {
        goals.removeAll { $0.id == goal.id }
    }
}
