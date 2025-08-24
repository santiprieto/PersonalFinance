import Foundation

/// Manages savings goals and updates progress toward each goal.
@MainActor
final class GoalsViewModel: ObservableObject {
    @Published private(set) var goals: [Goal] = []
    private let store: GoalStore

    init(store: GoalStore = .shared) {
        self.store = store
        Task { await loadGoals() }
    }

    func loadGoals() async {
        goals = await store.fetchGoals()
    }

    func add(goal: Goal) async {
        await store.add(goal)
        await loadGoals()
    }

    func update(goal: Goal) async {
        await store.update(goal)
        await loadGoals()
    }

    func delete(at offsets: IndexSet) async {
        for index in offsets {
            let goal = goals[index]
            await store.delete(goal)
        }
        await loadGoals()
    }
}
