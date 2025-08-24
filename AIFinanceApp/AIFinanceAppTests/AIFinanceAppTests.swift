import XCTest
@testable import AIFinanceApp

final class AIFinanceAppTests: XCTestCase {
    func testSampleDataCounts() {
        XCTAssertEqual(SampleData.transactions.count, 0)
        XCTAssertEqual(SampleData.budgets.count, 0)
        XCTAssertEqual(SampleData.goals.count, 0)
    }

    func testAddBudget() {
        let vm = BudgetsViewModel()
        XCTAssertEqual(vm.budgets.count, 0)
        vm.add(category: "Food", limit: 100)
        XCTAssertEqual(vm.budgets.count, 1)
    }

    func testAddGoal() {
        let vm = GoalsViewModel()
        XCTAssertEqual(vm.goals.count, 0)
        vm.add(title: "Vacation", targetAmount: 500, dueDate: Date())
        XCTAssertEqual(vm.goals.count, 1)
    }
}
