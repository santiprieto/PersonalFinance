import XCTest
@testable import AIFinanceApp

final class AIFinanceAppTests: XCTestCase {
    func testSampleDataCounts() {
        XCTAssertEqual(SampleData.transactions.count, 0)
        XCTAssertEqual(SampleData.budgets.count, 0)
        XCTAssertEqual(SampleData.goals.count, 0)
    }
}
