import SwiftUI

struct GoalsView: View {
    @ObservedObject var viewModel: GoalsViewModel
    @State private var showingAddGoal = false
    @State private var newTitle = ""
    @State private var newTarget = ""
    @State private var newDueDate = Date()

    var body: some View {
        List {
            ForEach(viewModel.goals) { goal in
                GoalRow(goal: goal)
            }
        }
        .navigationTitle("Goals")
        .toolbar {
            Button(action: { showingAddGoal = true }) {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $showingAddGoal) {
            NavigationStack {
                Form {
                    TextField("Title", text: $newTitle)
                    TextField("Target Amount", text: $newTarget)
                        .keyboardType(.decimalPad)
                    DatePicker("Due Date", selection: $newDueDate, displayedComponents: .date)
                    Button("Add") {
                        if let target = Double(newTarget) {
                            viewModel.add(title: newTitle, targetAmount: target, dueDate: newDueDate)
                            showingAddGoal = false
                            newTitle = ""
                            newTarget = ""
                            newDueDate = Date()
                        }
                    }
                }
                .navigationTitle("New Goal")
            }
        }
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
