

@_exported import MinimalBase

public protocol MoneyP: HasDecimalValue, HasCurrencyData {}

public extension MoneyP {
    
    /// minorUnits means smallest units in this currency, for ex. cents for USD
    var minorUnits: Int {
        return value.multiplying(byPowersOf10: Int16(currencyData.scale)).integerPart
    }
        
    func formatted(style: MoneyFormatter.Style = .code,
                   minDecimalDigits: Int? = nil,
                   maxDecimalDigits: Int? = nil,
                   _ locale: Locale = Locale.current) -> String? {
        let f = currencyData.formatter(style:style, minDecimalDigits: minDecimalDigits, maxDecimalDigits: maxDecimalDigits, locale)
        
        //fatalError()
        return f.string(from: self)
    }
}

//public extension MoneyP {
//
//    //MoneyP
//    init(_ value: Decimal) {
//        self.init(value, Currency.local as! C)
//    }
//
//    /// minorUnits means smallest units in this currency, for ex. cents for USD
//    init(minorUnits: Int,
//         _ currency: C) {
//        let value = Decimal(minorUnits).multiplying(byPowersOf10: Int16(currency.scale * -1))
//        self.init(value, currency)
//    }
//
//    init(integerLiteral value: Int) {
//        self.init(Decimal(integerLiteral: value))
//    }
//
//    init(floatLiteral value: Double) {
//        self.init(Decimal(floatLiteral: value))
//    }
//
//    init?<T>(exactly source: T) where T : BinaryInteger {
//        guard let value = Decimal(exactly: source) else { return nil }
//        self.init(value)
//    }
//
//    //MARK: -
//
////    static func ==(lhs: Money, rhs: Money) -> Bool {
////        return lhs.value == rhs.value
////            && lhs.currency.code == rhs.currency.code
////            && lhs.currency.scale == rhs.currency.scale
////            && lhs.currency.symbol == rhs.currency.symbol
////    }
////
////    func hash(into hasher: inout Hasher) {
////        hasher.combine(value)
////    }
//
//    static func <(lhs: Money, rhs: Money) -> Bool {
//
//        if lhs.currency.code != rhs.currency.code {
//            return lhs.currency.code < rhs.currency.code
//        }
//
//        return lhs.value < rhs.value
//    }
//}
//
//// MARK: - operators
//
//public extension Money {
//
//    static func +=(lhs: inout Money, rhs: Money) {
//        let result: Money = lhs + rhs
//        lhs.value = result.value
//    }
//
//    static func -=(lhs: inout Money, rhs: Money) {
//        let result: Money = lhs - rhs
//        lhs.value = result.value
//    }
//
//    static func *=(lhs: inout Money, rhs: Money) {
//        let result: Money = lhs * rhs
//        lhs.value = result.value
//    }
//
//    static func /=(lhs: inout Money, rhs: Money) {
//        let result: Money = lhs / rhs
//        lhs.value = result.value
//    }
//}
