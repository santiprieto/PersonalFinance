import SwiftUI

struct GoalsView: View {
    @ObservedObject var viewModel: GoalsViewModel
    @State private var showingForm = false
    @State private var editingGoal: Goal?

    var body: some View {
        List {
            ForEach(viewModel.goals) { goal in
                Button {
                    editingGoal = goal
                    showingForm = true
                } label: {
                    GoalRow(goal: goal)
                }
            }
            .onDelete { indexSet in
                Task { await viewModel.delete(at: indexSet) }
            }
        }
        .navigationTitle("Goals")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    editingGoal = nil
                    showingForm = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingForm) {
            GoalFormView(goal: editingGoal) { goal in
                Task {
                    if viewModel.goals.contains(where: { $0.id == goal.id }) {
                        await viewModel.update(goal: goal)
                    } else {
                        await viewModel.add(goal: goal)
                    }
                }
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

private struct GoalFormView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title: String
    @State private var targetAmount: String
    @State private var currentAmount: String
    @State private var dueDate: Date
    let goal: Goal?
    var onSave: (Goal) -> Void

    init(goal: Goal? = nil, onSave: @escaping (Goal) -> Void) {
        self.goal = goal
        _title = State(initialValue: goal?.title ?? "")
        _targetAmount = State(initialValue: goal.map { String($0.targetAmount) } ?? "")
        _currentAmount = State(initialValue: goal.map { String($0.currentAmount) } ?? "0")
        _dueDate = State(initialValue: goal?.dueDate ?? Date())
        self.onSave = onSave
    }

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Target Amount", text: $targetAmount)
                    .keyboardType(.decimalPad)
                TextField("Current Amount", text: $currentAmount)
                    .keyboardType(.decimalPad)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationTitle(goal == nil ? "New Goal" : "Edit Goal")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        guard
                            let target = Double(targetAmount),
                            let current = Double(currentAmount)
                        else { return }
                        let newGoal = Goal(
                            id: goal?.id ?? UUID(),
                            title: title,
                            targetAmount: target,
                            currentAmount: current,
                            dueDate: dueDate
                        )
                        onSave(newGoal)
                        dismiss()
                    }
                }
            }
        }
    }
}
