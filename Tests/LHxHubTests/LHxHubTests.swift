import XCTest
@testable import LHxHub

final class LHxHubTests: XCTestCase {
    func testOne() {
        
        XCTAssertFalse(isEnableLog)
        
        print(Date().dateToString(format: "yyyy MMM dd"))
        
//        let expiryDate = "19-07-2020" // Jan 10 2020
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd-M-yyyy"
//        let final = dateFormatter.date(from: expiryDate)
//        print(final ?? "")
//
//        let date = Date()
//        print(date.getHumanReadableDayString())
//        print(date.nextDate().dateToString(format: "dd MMM yyyy"))
//        print(date.previousDate())
//        print(date.addMonths(numberOfMonths: 5))
//
//        let num = "1234567890123456"
//        print(num.inserting(separator: " ", every: 4))
//
//        let password = "laohanme"
//        XCTAssertNotEqual(password, "password", "This password is too easy")
//
//        let email = "laohanme@gmail.com"
//        XCTAssertTrue(email.isValidEmail, "This email is not valid")
    }

    static var allTests = [
        ("ONE", testOne),
    ]
}
