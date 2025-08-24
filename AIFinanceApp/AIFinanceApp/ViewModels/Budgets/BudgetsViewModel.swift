import Foundation

/// Maintains the user's budget list and handles updates to individual budgets.
@MainActor
final class BudgetsViewModel: ObservableObject {
    @Published private(set) var budgets: [Budget] = []
    private let store: BudgetStore

    init(store: BudgetStore = .shared) {
        self.store = store
        Task { await loadBudgets() }
    }

    func loadBudgets() async {
        budgets = await store.fetchBudgets()
    }

    func add(budget: Budget) async {
        await store.add(budget)
        await loadBudgets()
    }

    func update(budget: Budget) async {
        await store.update(budget)
        await loadBudgets()
    }

    func delete(at offsets: IndexSet) async {
        for index in offsets {
            let budget = budgets[index]
            await store.delete(budget)
        }
        await loadBudgets()
    }
}
