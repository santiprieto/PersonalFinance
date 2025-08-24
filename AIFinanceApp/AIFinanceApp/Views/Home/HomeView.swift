import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @EnvironmentObject var appViewModel: AppViewModel

    var body: some View {
        List {
            Section {
                Picker("Currency", selection: $appViewModel.userSettings.currency) {
                    ForEach(UserSettings.availableCurrencies, id: \.self) { currency in
                        Text(currency).tag(currency)
                    }
                }
                .pickerStyle(.menu)

                Text("Balance: \(appViewModel.userSettings.currency) \(appViewModel.balance, specifier: "%.2f")")
                    .font(.headline)

                if !viewModel.insight.isEmpty {
                    Text(viewModel.insight)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }

            Section("Budgets") {
                ForEach(viewModel.budgets) { budget in
                    BudgetRow(budget: budget)
                }
                NavigationLink("View All", destination: BudgetsView(viewModel: BudgetsViewModel()))
            }

            Section("Recent Transactions") {
                ForEach(viewModel.transactions.prefix(5)) { transaction in
                    TransactionRow(transaction: transaction)
                }
                NavigationLink("View All", destination: TransactionsView(viewModel: TransactionsViewModel()))
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Dashboard")
        .task {
            await viewModel.loadData()
        }
    }
}

struct BudgetRow: View {
    let budget: Budget

    var progress: Double {
        guard budget.limit > 0 else { return 0 }
        return budget.spent / budget.limit
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(budget.category)
                Spacer()
                Text("\(Int(progress*100))%")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            ProgressView(value: progress)
                .progressViewStyle(.linear)
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
                .foregroundColor(transaction.amount < 0 ? .red : .green)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
        .environmentObject(AppViewModel())
}
