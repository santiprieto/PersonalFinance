import Foundation

/// Actor responsible for managing budget data asynchronously.
actor BudgetStore {
    static let shared = BudgetStore()

    private var budgets: [Budget] = SampleData.budgets

    private init() {}

    func fetchBudgets() -> [Budget] {
        budgets
    }

    func add(_ budget: Budget) async {
        budgets.append(budget)
    }

    func update(_ budget: Budget) async {
        if let index = budgets.firstIndex(where: { $0.id == budget.id }) {
            budgets[index] = budget
        }
    }

    func delete(_ budget: Budget) async {
        budgets.removeAll { $0.id == budget.id }
    }
}
