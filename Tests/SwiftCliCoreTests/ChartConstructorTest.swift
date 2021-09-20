import Foundation
import XCTest
@testable import SwiftCliCore


class PrinterTests: XCTestCase {
    func testPrintTopLevelMany() throws {
        let result = ChartConstructor().make_top_row(width: 4)
        XCTAssertEqual(result, "┌─┬─┬─┬─┐\n")
    }
    
    func testPrintTopLevelOne() throws {
        let result = ChartConstructor().make_top_row(width: 1)
        XCTAssertEqual(result, "┌─┐\n")
    }
    
    func testPrintTopLevelZero() throws {
        let result = ChartConstructor().make_top_row(width: 0)
        XCTAssertEqual(result, "")
    }
    
    func testPrintBottomLevelMany() throws {
        let result = ChartConstructor().make_bottom_row(width: 4)
        XCTAssertEqual(result, "└─┴─┴─┴─┘")
    }
    
    func testPrintMiddleLevelMany() throws {
        let result = ChartConstructor().make_middle_row(width: 4)
        XCTAssertEqual(result, "├─┼─┼─┼─┤\n")
    }
    
    func testPrintSingleRow() throws {
        let result = ChartConstructor().make_stitch_row(row: "k1 k1 p1 p1 k1 k1")
        XCTAssertEqual(result, "│ │ │-│-│ │ │\n")
    }
    
    func testFullPatternMany() throws {
        let result = ChartConstructor().make_chart(pattern: "k1 k1 p1 p1 k1 k1")
        let expectedresult = """
┌─┬─┬─┬─┬─┬─┐
│ │ │-│-│ │ │
└─┴─┴─┴─┴─┴─┘
"""
        XCTAssertEqual(result, expectedresult)
    }
}
