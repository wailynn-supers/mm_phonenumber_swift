import XCTest
import mm_phonenumber_swift

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssertTrue(PhoneValidator.isValidMMPhoneNumber(phoneNumber: "+95-9 9 73771507"))
        
        XCTAssertEqual(PhoneValidator.sanitizeNumber(phoneNumber: "+9595099 73771507"), "+959973771507")
        
        XCTAssertEqual(PhoneValidator.getTelecomName(phoneNumber: "09972334567"), OOREDOO)
        
        XCTAssertEqual(PhoneValidator.getTelecomName(phoneNumber: "09798111234"), TELENOR)
        
        XCTAssertEqual(PhoneValidator.getTelecomName(phoneNumber: "095511234"), MPT)
        
        XCTAssertEqual(PhoneValidator.getTelecomName(phoneNumber: "09254344567"), MPT)
        
        XCTAssertEqual(PhoneValidator.getTelecomName(phoneNumber: "0943152345"), MPT)
        
        XCTAssertEqual(PhoneValidator.getNetworkType(phoneNumber: "0943152345"), GSM_TYPE)
        XCTAssertEqual(PhoneValidator.getNetworkType(phoneNumber: "09254344567"), WCDMA_TYPE)
        XCTAssertEqual(PhoneValidator.getNetworkType(phoneNumber: "0973204356"), CDMA_800_TYPE)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
