import Foundation

/// Aggregates data for the dashboard and provides AI-generated insights.
@MainActor
final class HomeViewModel: ObservableObject {
    @Published var transactions: [Transaction] = SampleData.transactions
    @Published private(set) var budgets: [Budget] = []
    @Published private(set) var goals: [Goal] = []
    @Published var insight: String = ""

    private let insightsService: AIInsightsProviding
    private let budgetStore: BudgetStore
    private let goalStore: GoalStore

    init(
        insightsService: AIInsightsProviding = AIInsightsService(),
        budgetStore: BudgetStore = .shared,
        goalStore: GoalStore = .shared
    ) {
        self.insightsService = insightsService
        self.budgetStore = budgetStore
        self.goalStore = goalStore
        Task { await loadData() }
        fetchInsight()
    }

    func loadData() async {
        budgets = await budgetStore.fetchBudgets()
        goals = await goalStore.fetchGoals()
    }

    func fetchInsight() {
        insight = insightsService.weeklyInsight()
    }
}
