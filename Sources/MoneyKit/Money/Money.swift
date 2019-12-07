
/// Not precise money, cannot be used for financial operations, but good for inter, transl (replace Double with Decimal for finances)
/// Comparable and Equatable consider only value
public struct Money: MoneyT {
    
    public var currency: Currency
    
    public var amount: Double
    
    public var format: MoneyFormat
}
public extension Money {
    
    init(_ amount: Double,
         _ currency: Currency,
         _ format: MoneyFormat = .US_code) {
        self.currency = currency
        self.amount = amount
        self.format = format
    }
    
    init(_ amount: NSNumber,
         _ currency: Currency,
         _ format: MoneyFormat = .US_code) {
        self.init(amount.doubleValue,
                  currency, format)
    }
    
    
    //TODO:
    /// minorUnits means smallest units (coins) in this currency, for ex. cents for USD
    //    init(minorUnits: Int,
    //         _ currency: Currency) {
    //        let dec = Decimal(minorUnits).multiplying(byPowersOf10: Int16(currency.scale * -1)).nsDecimal.doubleValue
    //        self.init(dec, currency)
    //    }
    
    
    //MARK: -
    
    // HasDoubleP
    var value: Double {
        amount
    }
    
    
    //MARK: - operators
    
    static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.amount == rhs.amount // add currency ?
    }
    
    static func <(lhs: Self, rhs: Self) -> Bool {
        lhs.amount < rhs.amount
    }
}



// or rename to scale
/// minorUnits means smallest units in this currency, for ex. cents for USD
//    var minorUnits: Int {
//        L.notImpl()
//        //value.multiplying(byPowersOf10: Int16(currency.scale)).integerPart
//    }


/// Note: not all Locales are supported, for ex. those without country indication, like .english are not
/// Check lid.canBeUsedForCurrencies, crashes if false
//    func string(with currencyFormat: CurrencyFormat = .isoCode,
//                spellOutNumbers: Bool = false,
//                roundingMode: NumRoundingMode = .down,
//                usesGroupingSeparator: Bool = false,
//                minFractionDigits: Int = 0,
//                maxFractionDigits: Int = 10,
//                _ lid: LID = .englishUnitedStates) -> Str {
//
//        let format =  MoneyFormat(currencyFormat: currencyFormat,
//                                  spellOutNumbers: spellOutNumbers,
//                                  roundingMode: roundingMode,
//                                  usesGroupingSeparator: usesGroupingSeparator,
//                                  minFractionDigits: minFractionDigits,
//                                  maxFractionDigits: maxFractionDigits,
//                                  lid)
//        return MoneyFormatter.shared().string(from: self)
//    }

//    func string(with format: CurrencyFormat = .isoCode,
//                   minFractionDigits: Int? = nil,
//                   maxFractionDigits: Int? = nil,
//                   _ locale: LID = .current) -> Str? {
//        currency.formatter(style:style,
//                               minFractionDigits: minFractionDigits,
//                               maxFractionDigits: maxFractionDigits,
//                               locale).string(from: self)
//    }



//TODO: make 2 models - with Double and Decimal
/// for inter, transl of Strings use this
//public typealias Money = MoneyG<Double>

//For calculating use this
//public typealias Money = MoneyG<Decimal>


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
////            && lhs.currency.isoCode == rhs.currency.isoCode
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
//        if lhs.currency.isoCode != rhs.currency.isoCode {
//            return lhs.currency.isoCode < rhs.currency.isoCode
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
//
//MARK: operators + Decimal
//
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
