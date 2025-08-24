import SwiftUI

struct BudgetsView: View {
    @ObservedObject var viewModel: BudgetsViewModel

    var body: some View {
        List {
            ForEach(viewModel.budgets) { budget in
                BudgetRow(budget: budget)
            }
        }
        .navigationTitle("Budgets")
    }
}

#Preview {
    BudgetsView(viewModel: BudgetsViewModel())
}
