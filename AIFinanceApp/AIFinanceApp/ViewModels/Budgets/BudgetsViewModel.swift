import Foundation

final class BudgetsViewModel: ObservableObject {
    @Published var budgets: [Budget] = SampleData.budgets

    func update(budget: Budget) {
        if let index = budgets.firstIndex(where: { $0.id == budget.id }) {
            budgets[index] = budget
        }
    }
}
