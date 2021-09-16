import XCTest
import class Foundation.Bundle
@testable import swift-cli

final class swift_cliTests: XCTestCase {
    func testRe() throws {
        let result = validate("k1 p1 k1 p1")
        XCTAssertEqual(result, true)
    }

    /// Returns path to the built products directory.
    var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }
}
