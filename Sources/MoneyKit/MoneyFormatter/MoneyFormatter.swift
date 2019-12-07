

import MinimalBase


public final class MoneyFormatter {
    static let numFormatter = NumberFormatter.shared()
    
    private init(){}
    
    /// returns singleton instance, set up with given values
    /// if currencyCode or currencySymbol are not given -
    public static func shared(style: MoneyFormatter.Style = .code,
                              currencyCode: String? = nil,
                              currencySymbol: String? = nil,
                              minDecimalDigits: Int? = nil,
                              maxDecimalDigits: Int? = nil,
                              _ locale: Locale = .current) -> MoneyFormatter {
        
        Self.numFormatter.numberStyle = style.nstyle
        Self.numFormatter.locale = locale
        
        Self.numFormatter.currencyCode = currencyCode ?? locale.currencyCode
        Self.numFormatter.currencySymbol = currencySymbol ?? locale.currencySymbol
        
        if let minDecimalDigits = minDecimalDigits {
            Self.numFormatter.minimumFractionDigits = minDecimalDigits
        }
        if let maxDecimalDigits = maxDecimalDigits {
            Self.numFormatter.maximumFractionDigits = maxDecimalDigits
        }
        return MoneyFormatter()
    }
    
    //TODO: use CurrencyP
    /// returns singleton instance, set up with given values
    /// if currency is not given - extracts it from locale
    public static func shared(style: MoneyFormatter.Style = .code,
                              currency: Currency? = nil,
                              minDecimalDigits: Int? = nil,
                              maxDecimalDigits: Int? = nil,
                              _ locale: Locale = .current) -> MoneyFormatter {
        return shared(style: style, currencyCode: currency?.code, currencySymbol: currency?.symbol, minDecimalDigits: minDecimalDigits, maxDecimalDigits: maxDecimalDigits, locale)
    }
    
    //MARK: bruteforcers
    
    /// if currency, style or locale are not provided - uses all possible values set, otherwise overrides them with given
    public static func money(from string: String,
                             currencies: [Currency] = Currency.allCases,
                             styles: [Style] = Style.allCases,
                             _ locales: [Locale] = Locale.allLocales) -> Money? {
        
        fatalError()
    }
    
    
    //    public static func string(from money: MoneyP) -> String? {
    //        setup(with: money)
    //        return Self.numFormatter.string(from: money.value.nsDecimal)
    //    }
    
    
    //MARK: - converters -
    
    public func string(from money: MoneyP) -> String? {
        setup(with: money)
        return Self.numFormatter.string(from: money.value.nsDecimal)
    }
    
    /// if currency, style or locale are not provided - uses currently set, otherwise overrides them with given
    public func money(from string: String,
                      currency: Currency? = nil,
                      style: Style? = nil,
                      _ locale: Locale? = nil) -> Money? {
        
        Self.numFormatter.locale = locale
        if let style = style {
            Self.numFormatter.numberStyle = style.nstyle
        }
        if let currency = currency {
            Self.numFormatter.currencyCode = currency.code
            Self.numFormatter.currencySymbol = currency.symbol
            
            if let value = Self.numFormatter.number(from: string) {
                return Money(value, currency)
            }
            return nil
        }
        
        //TODO: bruteforce all currencies, locales ??
        for currency in Currency.allCases {
            setup(with: currency)
            guard let value = Self.numFormatter.number(from: string) else {
                continue
            }
            return Money(value, currency)
        }
        return nil
    }
    
    
    //TODO: can bruteforce
    /// if style is not provided - tries all styles
    public static func money(from string: String,
                             currency: Currency? = nil,
                             style: Style? = nil,
                             _ locale: Locale = .current) -> Money? {
        
        //        let fmtr = shared(style: style, currencyCode: currency?.code, currencySymbol: currency?.symbol, minDecimalDigits: minDecimalDigits, maxDecimalDigits: maxDecimalDigits, locale)
        //
        //        guard let currency = Currency.allCases.first(where: {
        //
        //            if let .number(from: string)
        //
        //        }) else {
        //            return nil
        //        }
        
        fatalError()
        //TODO: bruteforce all currenies, locales ??
        // setup formatter based on  money.currencyData
        // then make Money with this data
        //return Self.numFormatter.number(from: string)
    }
    
    
    //MARK: -
    
    //TODO: consider adding currency as arg
    public func currencyFrom(moneyString: String) -> Currency? {
        fatalError()
        //TODO: bruteforce all currenies, locales ??
        // setup formatter based on  money.currencyData
        //return Self.numFormatter.number(from: string)
        // then return the currency
    }
    
    
    //??
    //    public func stringFromMoney(with currency: CurrencyP,
    //                                value: Decimal) -> String? {
    //        fatalError()
    //        //TODO: setup formatter based on  money.currencyData
    //        //return Self.numFormatter.string(from: money.value)
    //    }
    
    
    //ISO
    public static func localizedString(from value: Decimal,
                                       style: Style) -> String {
        
        return NumberFormatter.localizedString(from: value as NSNumber,
                                               number: style.nstyle)
    }
    
    //MARK: setup
    
    public func setup(with currency: CurrencyP) {
        Self.numFormatter.currencySymbol = currency.symbol
        Self.numFormatter.currencyCode = currency.code
    }
    
    public func setup(with money: MoneyP) {
        setup(with: money.currencyData)
    }
    
    //MARK: - Style -
    
    /// Formatting style for money
    public enum Style: String, StrEnumT {
        
        /// "$2.00"
        case symbol // = currency / currencyAccounting
        
        /// "USD 2.00"
        case code // = currencyISOCode
        
        /// "2.00 dollars" (always plural)
        case fullName // = currencyPlural
        
        public var nstyle: NumberFormatter.Style {
            switch self {
            case .symbol:
                return .currency
            case .code:
                return .currencyISOCode
            case .fullName:
                return .currencyPlural
            }
        }
    }
    
    var style: Style {
        get {
            switch Self.numFormatter.numberStyle {
            case .currency:
                return .symbol
            case .currencyISOCode:
                return .code
            case .currencyPlural:
                return .fullName
            default:
                fatalError()
            }
        }
        set {
            Self.numFormatter.numberStyle = newValue.nstyle
        }
    }
    
    //MARK: public
    
    var locale: Locale {
        get {
            return Self.numFormatter.locale
        }
        set {
            Self.numFormatter.locale = newValue
        }
    }
    
    var generatesDecimalNumbers: Bool {
        get {
            return Self.numFormatter.generatesDecimalNumbers
        }
        set {
            Self.numFormatter.generatesDecimalNumbers = newValue
        }
    }
    
    var allowsFloats: Bool {
        get {
            return Self.numFormatter.allowsFloats
        }
        set {
            Self.numFormatter.allowsFloats = newValue
        }
    }
    
    var decimalSeparator: String {
        get {
            return Self.numFormatter.decimalSeparator
        }
        set {
            Self.numFormatter.decimalSeparator = newValue
        }
    }
    
    var alwaysShowsDecimalSeparator: Bool {
        get {
            return Self.numFormatter.alwaysShowsDecimalSeparator
        }
        set {
            Self.numFormatter.alwaysShowsDecimalSeparator = newValue
        }
    }
    
    var currencyDecimalSeparator: String {
        get {
            return Self.numFormatter.currencyDecimalSeparator
        }
        set {
            Self.numFormatter.currencyDecimalSeparator = newValue
        }
    }
    
    var usesGroupingSeparator: Bool {
        get {
            return Self.numFormatter.usesGroupingSeparator
        }
        set {
            Self.numFormatter.usesGroupingSeparator = newValue
        }
    }
    
    var groupingSeparator: String {
        get {
            return Self.numFormatter.groupingSeparator
        }
        set {
            Self.numFormatter.groupingSeparator = newValue
        }
    }
    
    
    var currencyCode: String {
        get {
            return Self.numFormatter.currencyCode
        }
        set {
            Self.numFormatter.currencyCode = newValue
        }
    }
    
    var currencySymbol: String {
        get {
            return Self.numFormatter.currencySymbol
        }
        set {
            Self.numFormatter.currencySymbol = newValue
        }
    }
    
    var internationalCurrencySymbol: String {
        get {
            return Self.numFormatter.internationalCurrencySymbol
        }
        set {
            Self.numFormatter.internationalCurrencySymbol = newValue
        }
    }
    
    var percentSymbol: String {
        get {
            return Self.numFormatter.percentSymbol
        }
        set {
            Self.numFormatter.percentSymbol = newValue
        }
    }
    
    
    var groupingSize: Int {
        get {
            return Self.numFormatter.groupingSize
        }
        set {
            Self.numFormatter.groupingSize = newValue
        }
    }
    
    var secondaryGroupingSize: Int {
        get {
            return Self.numFormatter.secondaryGroupingSize
        }
        set {
            Self.numFormatter.secondaryGroupingSize = newValue
        }
    }
    
    var multiplier: NSNumber? {
        get {
            return Self.numFormatter.multiplier
        }
        set {
            Self.numFormatter.multiplier = newValue
        }
    }
    
    var formatWidth: Int {
        get {
            return Self.numFormatter.formatWidth
        }
        set {
            Self.numFormatter.formatWidth = newValue
        }
    }
    
    var paddingCharacter: String {
        get {
            return Self.numFormatter.paddingCharacter
        }
        set {
            Self.numFormatter.paddingCharacter = newValue
        }
    }
    
    var roundingIncrement: NSNumber {
        get {
            return Self.numFormatter.roundingIncrement
        }
        set {
            Self.numFormatter.roundingIncrement = newValue
        }
    }
    
    var minimumIntegerDigits: Int {
        get {
            return Self.numFormatter.minimumIntegerDigits
        }
        set {
            Self.numFormatter.minimumIntegerDigits = newValue
        }
    }
    
    var maximumIntegerDigits: Int {
        get {
            return Self.numFormatter.maximumIntegerDigits
        }
        set {
            Self.numFormatter.maximumIntegerDigits = newValue
        }
    }
    
    var minimumFractionDigits: Int {
        get {
            return Self.numFormatter.minimumFractionDigits
        }
        set {
            Self.numFormatter.minimumFractionDigits = newValue
        }
    }
    
    var maximumFractionDigits: Int {
        get {
            return Self.numFormatter.maximumFractionDigits
        }
        set {
            Self.numFormatter.maximumFractionDigits = newValue
        }
    }
    
    
    var currencyGroupingSeparator: String {
        get {
            return Self.numFormatter.currencyGroupingSeparator
        }
        set {
            Self.numFormatter.currencyGroupingSeparator = newValue
        }
    }
    
    var isLenient: Bool {
        get {
            return Self.numFormatter.isLenient
        }
        set {
            Self.numFormatter.isLenient = newValue
        }
    }
    
    var usesSignificantDigits: Bool {
        get {
            return Self.numFormatter.usesSignificantDigits
        }
        set {
            Self.numFormatter.usesSignificantDigits = newValue
        }
    }
    
    var minimumSignificantDigits: Int {
        get {
            return Self.numFormatter.minimumSignificantDigits
        }
        set {
            Self.numFormatter.minimumSignificantDigits = newValue
        }
    }
    
    var maximumSignificantDigits: Int {
        get {
            return Self.numFormatter.maximumSignificantDigits
        }
        set {
            Self.numFormatter.maximumSignificantDigits = newValue
        }
    }
    
    var isPartialStringValidationEnabled: Bool {
        get {
            return Self.numFormatter.isPartialStringValidationEnabled
        }
        set {
            Self.numFormatter.isPartialStringValidationEnabled = newValue
        }
    }
    
    var hasThousandSeparators: Bool {
        get {
            return Self.numFormatter.hasThousandSeparators
        }
        set {
            Self.numFormatter.hasThousandSeparators = newValue
        }
    }
    
    var thousandSeparator: String {
        get {
            return Self.numFormatter.thousandSeparator
        }
        set {
            Self.numFormatter.thousandSeparator = newValue
        }
    }
    
    
    var paddingPosition: NumberFormatter.PadPosition {
        get {
            return Self.numFormatter.paddingPosition
        }
        set {
            Self.numFormatter.paddingPosition = newValue
        }
    }
    
    var roundingMode: NumberFormatter.RoundingMode {
        get {
            return Self.numFormatter.roundingMode
        }
        set {
            Self.numFormatter.roundingMode = newValue
        }
    }
    
    var roundingBehavior: NSDecimalNumberHandler {
        get {
            return Self.numFormatter.roundingBehavior
        }
        set {
            Self.numFormatter.roundingBehavior = newValue
        }
    }
    
    
    
    
    //  /// Return a shared formatter
    //   func shared(style: Style = .code,
    //                     locale: Locale = .current,
    //                     roundingMode: NumberFormatter.RoundingMode = .down,
    //                     usesGroupingSeparator: Bool = false,
    //                     minFractionDigits: Int = 0,
    //                     maxFractionDigits: Int = 0) -> MoneyFormatter {
    //
    //      switch style {
    //      case .code:
    //          fatalError()
    //          //Self.numFormatter.numberStyle = .currency
    //
    //      case .singular:
    //          fatalError()
    //          //Self.numFormatter.numberStyle = .currency
    //
    //      case .plural:
    //          Self.numFormatter.numberStyle = .currencyPlural
    //      }
    //
    //      Self.numFormatter.locale = locale
    //      Self.numFormatter.roundingMode = roundingMode
    //      Self.numFormatter.usesGroupingSeparator = usesGroupingSeparator
    //      Self.numFormatter.minimumFractionDigits = minFractionDigits
    //      Self.numFormatter.maximumFractionDigits = maxFractionDigits
    //      return Self.numFormatter
    //  }
    
    
    //
    //    class func defaultFormatterBehavior() -> NumberFormatter.Behavior
    //
    //    class func setDefaultFormatterBehavior(_ behavior: NumberFormatter.Behavior)
    
    
    //     var perMillSymbol: String!
    
    //     var minusSign: String!
    //     var plusSign: String!
    //     var exponentSymbol: String!
    
    //  var formatterBehavior: NumberFormatter.Behavior
    
    //     var negativeFormat: String!
    //
    //     var textAttributesForNegativeValues: [String : Any]?
    //
    //     var positiveFormat: String!
    //
    //     var textAttributesForPositiveValues: [String : Any]?
    
    //     var zeroSymbol: String?
    //
    //     var textAttributesForZero: [String : Any]?
    //
    //     var nilSymbol: String
    //
    //     var textAttributesForNil: [String : Any]?
    //
    //     var notANumberSymbol: String!
    //
    //     var textAttributesForNotANumber: [String : Any]?
    //
    //     var positiveInfinitySymbol: String
    //
    //     var textAttributesForPositiveInfinity: [String : Any]?
    //
    //     var negativeInfinitySymbol: String
    //
    //     var textAttributesForNegativeInfinity: [String : Any]?
    
    //     var positivePrefix: String!
    //
    //     var positiveSuffix: String!
    //
    //     var negativePrefix: String!
    //
    //     var negativeSuffix: String!
    
    //     var minimum: NSNumber?
    //     var maximum: NSNumber?
    
    //     var localizesFormat: Bool {}
    //     var format: String {}
}
