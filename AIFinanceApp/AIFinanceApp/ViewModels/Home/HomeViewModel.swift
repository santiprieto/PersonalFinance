import Foundation

/// Aggregates data for the dashboard and provides AI-generated insights.
final class HomeViewModel: ObservableObject {
    @Published var transactions: [Transaction] = SampleData.transactions
    @Published var budgets: [Budget] = SampleData.budgets
    @Published var goals: [Goal] = SampleData.goals
    @Published var insight: String = ""

    private let insightsService: AIInsightsProviding

    init(insightsService: AIInsightsProviding = AIInsightsService()) {
        self.insightsService = insightsService
        fetchInsight()
    }

    func fetchInsight() {
        insight = insightsService.weeklyInsight()
    }
}
