import SwiftUI

struct TransactionsView: View {
    @ObservedObject var viewModel: TransactionsViewModel

    var body: some View {
        List {
            ForEach(viewModel.transactions) { transaction in
                TransactionRow(transaction: transaction)
            }
            .onDelete(perform: viewModel.delete)
        }
        .navigationTitle("Transactions")
        .toolbar { EditButton() }
    }
}

#Preview {
    TransactionsView(viewModel: TransactionsViewModel())
}
