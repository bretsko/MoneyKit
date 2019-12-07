

import MinimalBase

/// Comparable and Equatable consider only value
public struct Money: MoneyP, Comparable, CustomStringConvertible {
    
    public var currency: Currency
    
    /// amount
    public private(set) var value: Decimal
    
    public init(_ value: Decimal = 0,
                _ currency: Currency) {
        self.value = value
        self.currency = currency
    }
}
public extension Money {
    
    /// minorUnits means smallest units in this currency, for ex. cents for USD
    init(minorUnits: Int,
         _ currency: Currency) {
        let dec = Decimal(minorUnits).multiplying(byPowersOf10: Int16(currency.scale * -1))
        self.init(dec, currency)
    }
    
    // conv init
    init(_ value: Double = 0,
         _ currency: Currency) {
        self.init(Decimal(value), currency)
    }
    
    // conv init
    init(_ value: NSNumber,
         _ currency: Currency) {
        self.init(value.doubleValue, currency)
    }
    
    //MARK: -
    
    // HasCurrencyData
    var currencyData: CurrencyP {
        return currency
    }
    
    var description: String {
        return formatted(style: .code, Locale.current)! //??
    }
    
    //MARK: operators
    
    // Equatable
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.value == rhs.value
    }
    
    // Comparable
    static func <(lhs: Self, rhs: Self) -> Bool {
        return lhs.value < rhs.value
    }
    
    
    //MARK: operators + Decimal
    
    //    static func +(lhs: Self, rhs: Decimal) -> Self {
    //        return Self(lhs.value + rhs)
    //    }
    //
    //    static func +(lhs: Decimal, rhs: Self) -> Self {
    //        return Self(lhs + rhs.value)
    //    }
    //
    //    static func -(lhs: Self, rhs: Decimal) -> Self {
    //        return Self(lhs.value - rhs)
    //    }
    //
    //    static func -(lhs: Decimal, rhs: Self) -> Self {
    //        return Self(lhs - rhs.value)
    //    }
    //
    //    static func *(lhs: Self, rhs: Decimal) -> Self {
    //        return Self(lhs.value * rhs)
    //    }
    //
    //    static func *(lhs: Decimal, rhs: Self) -> Self {
    //        return Self(lhs * rhs.value)
    //    }
    //
    //    static func /(lhs: Self, rhs: Decimal) -> Self {
    //        return Self(lhs.value / rhs)
    //    }
    //
    //    static func /(lhs: Decimal, rhs: Self) -> Self {
    //        return Self(lhs / rhs.value)
    //    }
    //
    //    //MARK: ExpressibleByFloatLiteral
    //
    //    init(floatLiteral value: Double) {
    //        self.init(Decimal(floatLiteral: value))
    //    }
    //
    //    init(integerLiteral value: Int) {
    //        self.init(Decimal(integerLiteral: value))
    //    }
    //
    //    init?<T>(exactly source: T) where T : BinaryInteger {
    //        guard let _decimal = Decimal(exactly: source) else { return nil }
    //        self.init(_decimal)
    //    }
}

//??
//public extension Money {
//
//    static func +(lhs: Self, rhs: Self.FloatLiteralType) -> Self {
//        return Self(lhs.value + Decimal(floatLiteral: rhs))
//    }
//
//    static func +(lhs: Self.FloatLiteralType, rhs: Self) -> Self {
//        return Self(Decimal(floatLiteral: lhs) + rhs.value)
//    }
//
//    static func -(lhs: Self, rhs: Self.FloatLiteralType) -> Self {
//        return Self(lhs.value - Decimal(floatLiteral: rhs))
//    }
//
//    static func -(lhs: Self.FloatLiteralType, rhs: Self) -> Self {
//        return Self(Decimal(floatLiteral: lhs) - rhs.value)
//    }
//
//    static func *(lhs: Self, rhs: Self.FloatLiteralType) -> Self {
//        return Self(lhs.value * Decimal(floatLiteral: rhs))
//    }
//
//    static func *(lhs: Self.FloatLiteralType, rhs: Self) -> Self {
//        return Self(Decimal(floatLiteral: lhs) * rhs.value)
//    }
//
//    static func /(lhs: Self, rhs: Self.FloatLiteralType) -> Self {
//        return Self(lhs.value / Decimal(floatLiteral: rhs))
//    }
//
//    static func /(lhs: Self.FloatLiteralType, rhs: Self) -> Self {
//        return Self(Decimal(floatLiteral: lhs) / rhs.value)
//    }
//}
