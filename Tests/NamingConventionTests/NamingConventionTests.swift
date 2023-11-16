import XCTest
@testable import NamingConvention

final class NamingConventionTests: XCTestCase {
    func testPascalCase() throws {
        let processor = PascalCaseProcessor()
        XCTAssertTrue(processor.match(text: "PascalCase"))
        XCTAssertFalse(processor.match(text: "camelCase"))
        XCTAssertEqual(processor.segmented(text: "PascalCase"), ["pascal", "case"])
        XCTAssertEqual(processor.connected(segments: ["pascal", "case"]), "PascalCase")
    }

    func testCamelCase() throws {
        let processor = CamelCaseProcessor()
        XCTAssertTrue(processor.match(text: "camelCase"))
        XCTAssertFalse(processor.match(text: "PascalCase"))
        XCTAssertEqual(processor.segmented(text: "camelCase"), ["camel", "case"])
        XCTAssertEqual(processor.connected(segments: ["camel", "case"]), "camelCase")
    }
}
