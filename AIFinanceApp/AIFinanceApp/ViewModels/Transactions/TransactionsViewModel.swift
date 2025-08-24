import Foundation

final class TransactionsViewModel: ObservableObject {
    @Published var transactions: [Transaction] = SampleData.transactions

    func add(_ transaction: Transaction) {
        transactions.append(transaction)
    }

    func delete(at offsets: IndexSet) {
        transactions.remove(atOffsets: offsets)
    }
}
