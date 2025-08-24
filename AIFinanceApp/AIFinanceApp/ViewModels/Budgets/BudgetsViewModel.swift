import Foundation

/// Maintains the user's budget list and handles updates to individual budgets.
final class BudgetsViewModel: ObservableObject {
    @Published var budgets: [Budget] = SampleData.budgets

    func update(budget: Budget) {
        if let index = budgets.firstIndex(where: { $0.id == budget.id }) {
            budgets[index] = budget
        }
    }

    func add(category: String, limit: Double) {
        let budget = Budget(id: UUID(), category: category, limit: limit, spent: 0)
        budgets.append(budget)
    }
}
