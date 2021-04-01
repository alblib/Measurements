import XCTest
@testable import Measurements

final class MeasurementsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Measurements().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
