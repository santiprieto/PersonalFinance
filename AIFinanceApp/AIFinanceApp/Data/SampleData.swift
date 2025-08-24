import Foundation

/// Provides sample data used across the application for previews and prototyping.
struct SampleData {
    static var transactions: [Transaction] { Transaction.sample }
    static var budgets: [Budget] { Budget.sample }
    static var goals: [Goal] { Goal.sample }
}
