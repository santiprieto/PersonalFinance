import SwiftUI

struct BudgetsView: View {
    @ObservedObject var viewModel: BudgetsViewModel
    @State private var showingAddBudget = false
    @State private var newCategory = ""
    @State private var newLimit = ""

    var body: some View {
        List {
            ForEach(viewModel.budgets) { budget in
                BudgetRow(budget: budget)
            }
        }
        .navigationTitle("Budgets")
        .toolbar {
            Button(action: { showingAddBudget = true }) {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $showingAddBudget) {
            NavigationStack {
                Form {
                    TextField("Category", text: $newCategory)
                    TextField("Limit", text: $newLimit)
                        .keyboardType(.decimalPad)
                    Button("Add") {
                        if let limit = Double(newLimit) {
                            viewModel.add(category: newCategory, limit: limit)
                            showingAddBudget = false
                            newCategory = ""
                            newLimit = ""
                        }
                    }
                }
                .navigationTitle("New Budget")
            }
        }
    }
}

#Preview {
    BudgetsView(viewModel: BudgetsViewModel())
}
