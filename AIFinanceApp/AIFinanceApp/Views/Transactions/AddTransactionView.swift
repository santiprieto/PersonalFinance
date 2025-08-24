import SwiftUI

/// Form used to create a new transaction.
struct AddTransactionView: View {
    @ObservedObject var viewModel: TransactionsViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var merchant: String = ""
    @State private var category: String = ""
    @State private var amount: String = ""
    @State private var date: Date = .now

    var body: some View {
        NavigationView {
            Form {
                TextField("Merchant", text: $merchant)
                TextField("Category", text: $category)
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
                DatePicker("Date", selection: $date, displayedComponents: .date)
            }
            .navigationTitle("Add Transaction")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") { save() }
                        .disabled(merchant.isEmpty || amount.isEmpty)
                }
            }
        }
    }

    private func save() {
        let newTransaction = Transaction(
            id: UUID(),
            merchant: merchant,
            category: category,
            amount: Double(amount) ?? 0,
            date: date,
            tags: []
        )
        viewModel.add(newTransaction)
        dismiss()
    }
}

#Preview {
    AddTransactionView(viewModel: TransactionsViewModel())
}

