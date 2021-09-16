import XCTest
@testable import chartify


class chartifytest: XCTestCase {
   // let validator = validate()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidatorForGoodInput() {
       // let result = validator.validate("k1")
        let result = Validator().validate(pattern: "k1")
        XCTAssertEqual(result, true)
    }
}
