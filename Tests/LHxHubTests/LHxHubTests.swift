import XCTest
@testable import LHxHub

final class LHxHubTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssert(LHxHub.isEnableLog, "Hello")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
