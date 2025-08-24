import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @EnvironmentObject var appViewModel: AppViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Balance: \(appViewModel.userSettings.currency) \(appViewModel.balance, specifier: "%.2f")")
                    .font(.headline)

                if !viewModel.insight.isEmpty {
                    Text(viewModel.insight)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Text("Budgets")
                    .font(.title2)
                ForEach(viewModel.budgets) { budget in
                    BudgetRow(budget: budget)
                }

                Text("Recent Transactions")
                    .font(.title2)
                ForEach(viewModel.transactions.prefix(5)) { transaction in
                    TransactionRow(transaction: transaction)
                }
            }
            .padding()
        }
        .navigationTitle("Dashboard")
    }
}

struct BudgetRow: View {
    let budget: Budget

    var progress: Double {
        guard budget.limit > 0 else { return 0 }
        return budget.spent / budget.limit
    }

    var body: some View {
        HStack {
            Text(budget.category)
            Spacer()
            ProgressView(value: progress)
                .progressViewStyle(.circular)
            Text("\(Int(progress*100))%")
                .font(.caption)
        }
    }
}

struct TransactionRow: View {
    let transaction: Transaction

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.merchant)
                Text(transaction.category)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(String(format: "%.2f", transaction.amount))
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
        .environmentObject(AppViewModel())
}
