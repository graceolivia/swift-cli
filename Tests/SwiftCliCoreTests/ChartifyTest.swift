import Foundation
import XCTest
@testable import SwiftCliCore

class ChartifyTests: XCTestCase {
    func testValidatorForK1Input() throws {
        let result = Validator().validate(pattern: "k1")
        XCTAssertEqual(result, true)
    }
    func testValidatorForP1Input() throws {
        let result = Validator().validate(pattern: "k1")
        XCTAssertEqual(result, true)
    }
    func testValidatorForK1P1Input() throws {
        let result = Validator().validate(pattern: "k1 p1")
        XCTAssertEqual(result, true)
    }
    func testValidatorForG1P1Input() throws {
        let result = Validator().validate(pattern: "g1 p1")
        XCTAssertEqual(result, false)
    }
    
}

class PrinterTests: XCTestCase {
    func testPrintTopLevel() throws {
        let result = Charter().make_top_row(width: 4)
        XCTAssertEqual(result, "┌─┬─┬─┬─┐")
    }
    
    func testPrintBottomLevel() throws {
        let result = Charter().make_bottom_row(width: 4)
        XCTAssertEqual(result, "└─┴─┴─┴─┘")
    }
    
    func testPrintMiddleLevel() throws {
        let result = Charter().make_middle_row(width: 4)
        XCTAssertEqual(result, "├─┼─┼─┼─┤")
    }
    
    
    
    
}
