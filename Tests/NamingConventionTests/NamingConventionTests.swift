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

    func testKebabCase() throws {
        let processor = KebabCaseProcessor()
        XCTAssertTrue(processor.match(text: "kebab-case"))
        XCTAssertFalse(processor.match(text: "PascalCase"))
        XCTAssertEqual(processor.segmented(text: "kebab-case"), ["kebab", "case"])
        XCTAssertEqual(processor.connected(segments: ["kebab", "case"]), "kebab-case")
    }

    func testSnakeCase() throws {
        let processor = SnakeCaseProcessor()
        XCTAssertTrue(processor.match(text: "snake_case"))
        XCTAssertFalse(processor.match(text: "PascalCase"))
        XCTAssertEqual(processor.segmented(text: "snake_case"), ["snake", "case"])
        XCTAssertEqual(processor.connected(segments: ["snake", "case"]), "snake_case")
    }
}
