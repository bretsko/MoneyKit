//import Quick
//import Nimble
//@testable import MoneyKit
//
//extension MoneyTestCase {
//    
//    func test__description() {
//        money = 10
//        let result = money.formatted(forLocaleId: "en_US")
//        XCTAssertEqual(result, "$10.00")
//    }
//    
//    func test__description_float() {
//        money = 10.12
//        let result = money.formatted(forLocaleId: "en_US")
//        XCTAssertEqual(result, "$10.12")
//    }
//}
//
//extension MoneyTestCase {
//    
//    func test__iso_description() {
//        gbp = 10
//        let result = gbp.formatted(forLocaleId: "en_GB")
//        XCTAssertEqual(result, "£10.00")
//    }
//    
//    func test__iso_description_spain() {
//        gbp = 10
//        let result = gbp.formatted(forLocaleId: "es_ES")
//        // Note that for Spanish from Spain, the decimal point indicator is a comma,
//        // and the currency symbol is placed after the numbers.
//        XCTAssertEqual(result, "10,00 £")
//    }
//}
