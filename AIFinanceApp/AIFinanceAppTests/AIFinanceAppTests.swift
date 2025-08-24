import XCTest
@testable import AIFinanceApp

final class AIFinanceAppTests: XCTestCase {
    func testSampleDataCounts() {
        XCTAssertEqual(SampleData.transactions.count, 3)
        XCTAssertEqual(SampleData.budgets.count, 3)
        XCTAssertEqual(SampleData.goals.count, 3)
    }
}
