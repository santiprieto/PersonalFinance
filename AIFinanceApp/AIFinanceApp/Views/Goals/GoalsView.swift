import SwiftUI

struct GoalsView: View {
    @ObservedObject var viewModel: GoalsViewModel

    var body: some View {
        List {
            ForEach(viewModel.goals) { goal in
                GoalRow(goal: goal)
            }
        }
        .navigationTitle("Goals")
    }
}

struct GoalRow: View {
    let goal: Goal

    var progress: Double {
        guard goal.targetAmount > 0 else { return 0 }
        return goal.currentAmount / goal.targetAmount
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(goal.title)
            ProgressView(value: progress)
            Text("\(Int(progress*100))%")
                .font(.caption)
        }
    }
}

#Preview {
    GoalsView(viewModel: GoalsViewModel())
}
