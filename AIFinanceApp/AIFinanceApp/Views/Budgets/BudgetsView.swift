import SwiftUI

struct BudgetsView: View {
    @ObservedObject var viewModel: BudgetsViewModel
    @State private var showingForm = false
    @State private var editingBudget: Budget?

    var body: some View {
        List {
            ForEach(viewModel.budgets) { budget in
                Button {
                    editingBudget = budget
                    showingForm = true
                } label: {
                    BudgetRow(budget: budget)
                }
            }
            .onDelete { indexSet in
                Task { await viewModel.delete(at: indexSet) }
            }
        }
        .navigationTitle("Budgets")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    editingBudget = nil
                    showingForm = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingForm) {
            BudgetFormView(budget: editingBudget) { budget in
                Task {
                    if viewModel.budgets.contains(where: { $0.id == budget.id }) {
                        await viewModel.update(budget: budget)
                    } else {
                        await viewModel.add(budget: budget)
                    }
                }
            }
        }
    }
}

#Preview {
    BudgetsView(viewModel: BudgetsViewModel())
}

private struct BudgetFormView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var category: String
    @State private var limit: String
    let budget: Budget?
    var onSave: (Budget) -> Void

    init(budget: Budget? = nil, onSave: @escaping (Budget) -> Void) {
        self.budget = budget
        _category = State(initialValue: budget?.category ?? "")
        _limit = State(initialValue: budget.map { String($0.limit) } ?? "")
        self.onSave = onSave
    }

    var body: some View {
        NavigationStack {
            Form {
                TextField("Category", text: $category)
                TextField("Limit", text: $limit)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle(budget == nil ? "New Budget" : "Edit Budget")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        guard let limitValue = Double(limit) else { return }
                        let newBudget = Budget(
                            id: budget?.id ?? UUID(),
                            category: category,
                            limit: limitValue,
                            spent: budget?.spent ?? 0
                        )
                        onSave(newBudget)
                        dismiss()
                    }
                }
            }
        }
    }
}
