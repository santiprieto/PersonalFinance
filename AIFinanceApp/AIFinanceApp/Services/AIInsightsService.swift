import Foundation

/// Mock service that simulates AI generated financial insights.
protocol AIInsightsProviding {
    func weeklyInsight() -> String
}

struct AIInsightsService: AIInsightsProviding {
    func weeklyInsight() -> String {
        // Placeholder implementation for MVP
        "You spent 20% more on dining this week"
    }
}
