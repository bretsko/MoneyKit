

public extension MoneyFormatter {
    
    var currencyFormat: CurrencyFormat {
        get  {
            CurrencyFormat(numberStyle)!
        }
        set {
            numFormatter.numberStyle = newValue.numStyle
        }
    }
    
    private var numberStyle: NumberFormatter.Style {
        get {
            numFormatter.numberStyle
        }
        set {
            numFormatter.numberStyle = newValue
        }
    }
    
    
    //MARK: -
    
    // HasCurrencyP
    var currency: Currency {
        get {
            Currency(rawValue: currencyCode)! //?? locale.currencyCode
        }
        set {
            self.currencyCode = newValue.isoCode
            self.currencySymbol = newValue.symbol
        }
    }
    
    
    //MARK: - currency
    
    var currencyCode: Str {
        get {
            numFormatter.currencyCode!
        }
        set {
            numFormatter.currencyCode = newValue
        }
    }
    
    var currencySymbol: Str {
        get {
            numFormatter.currencySymbol!
        }
        set {
            numFormatter.currencySymbol = newValue
        }
    }
    var minFractionDigits: Int {
        get {
            numFormatter.minimumFractionDigits
        }
        set {
            numFormatter.minimumFractionDigits = newValue
        }
    }
    var maxFractionDigits: Int {
        get {
            numFormatter.maximumFractionDigits
        }
        set {
            numFormatter.maximumFractionDigits = newValue
        }
    }
    
    //MARK: - locale
    
    /// if cannot be used for currencies - setter ignores the value
    var lid: LID {
        LID(numFormatter.locale!)
    }
    
    /// Note: not all Locales are supported, for ex. those without country indication, like .english are not
    /// Check lid.canBeUsedForCurrencies
    @discardableResult
    func setLocale(_ newLID: LID) -> Bool {
        guard newLID.canBeUsedForCurrencies else {
            return false
        }
        numFormatter.locale = newLID.locale
        return true
    }
    
    
    //MARK: setup
    
    func setup(with money: MoneyP) {
        format = money.format
        currency = money.currency
    }
    
    var roundingMode: NumberFormatter.RoundingMode {
        get {
            numFormatter.roundingMode
        }
        set {
            numFormatter.roundingMode = newValue
        }
    }
    
    var usesGroupingSeparator: Bool {
        get {
            numFormatter.usesGroupingSeparator
        }
        set {
            numFormatter.usesGroupingSeparator = newValue
        }
    }
}


//    func setup(with currency: Currency) {
//        currencySymbol = currency.symbol
//        currencyCode = currency.isoCode
//    }


//MARK:

//
//    var generatesDecimalNumbers: Bool {
//        get {
//            return generatesDecimalNumbers
//        }
//        set {
//            generatesDecimalNumbers = newValue
//        }
//    }
//
//    var allowsFloats: Bool {
//        get {
//            return allowsFloats
//        }
//        set {
//            allowsFloats = newValue
//        }
//    }
//
//    var decimalSeparator: Str {
//        get {
//            return decimalSeparator
//        }
//        set {
//            decimalSeparator = newValue
//        }
//    }
//
//    var alwaysShowsDecimalSeparator: Bool {
//        get {
//            return alwaysShowsDecimalSeparator
//        }
//        set {
//            alwaysShowsDecimalSeparator = newValue
//        }
//    }
//
//    var currencyDecimalSeparator: Str {
//        get {
//            return currencyDecimalSeparator
//        }
//        set {
//            currencyDecimalSeparator = newValue
//        }
//    }
//
//    var usesGroupingSeparator: Bool {
//        get {
//            return usesGroupingSeparator
//        }
//        set {
//            usesGroupingSeparator = newValue
//        }
//    }
//
//    var groupingSeparator: Str {
//        get {
//            return groupingSeparator
//        }
//        set {
//            groupingSeparator = newValue
//        }
//    }
//
//
//    var currencyCode: Str {
//        get {
//            return currencyCode
//        }
//        set {
//            currencyCode = newValue
//        }
//    }
//
//    var currencySymbol: Str {
//        get {
//            return currencySymbol
//        }
//        set {
//            currencySymbol = newValue
//        }
//    }
//
//    var internationalCurrencySymbol: Str {
//        get {
//            return internationalCurrencySymbol
//        }
//        set {
//            internationalCurrencySymbol = newValue
//        }
//    }
//
//    var percentSymbol: Str {
//        get {
//            return percentSymbol
//        }
//        set {
//            percentSymbol = newValue
//        }
//    }
//
//
//    var groupingSize: Int {
//        get {
//            return groupingSize
//        }
//        set {
//            groupingSize = newValue
//        }
//    }
//
//    var secondaryGroupingSize: Int {
//        get {
//            return secondaryGroupingSize
//        }
//        set {
//            secondaryGroupingSize = newValue
//        }
//    }
//
//    var multiplier: NSNumber? {
//        get {
//            return multiplier
//        }
//        set {
//            multiplier = newValue
//        }
//    }
//
//    var formatWidth: Int {
//        get {
//            return formatWidth
//        }
//        set {
//            formatWidth = newValue
//        }
//    }
//
//    var paddingCharacter: Str {
//        get {
//            return paddingCharacter
//        }
//        set {
//            paddingCharacter = newValue
//        }
//    }
//
//    var roundingIncrement: NSNumber {
//        get {
//            return roundingIncrement
//        }
//        set {
//            roundingIncrement = newValue
//        }
//    }
//
//    var minimumIntegerDigits: Int {
//        get {
//            return minimumIntegerDigits
//        }
//        set {
//            minimumIntegerDigits = newValue
//        }
//    }
//
//    var maximumIntegerDigits: Int {
//        get {
//            return maximumIntegerDigits
//        }
//        set {
//            maximumIntegerDigits = newValue
//        }
//    }
//
//    var minimumFractionDigits: Int {
//        get {
//            return minimumFractionDigits
//        }
//        set {
//            minimumFractionDigits = newValue
//        }
//    }
//
//    var maximumFractionDigits: Int {
//        get {
//            return maximumFractionDigits
//        }
//        set {
//            maximumFractionDigits = newValue
//        }
//    }
//
//
//    var currencyGroupingSeparator: Str {
//        get {
//            return currencyGroupingSeparator
//        }
//        set {
//            currencyGroupingSeparator = newValue
//        }
//    }
//
//    var isLenient: Bool {
//        get {
//            return isLenient
//        }
//        set {
//            isLenient = newValue
//        }
//    }
//
//    var usesSignificantDigits: Bool {
//        get {
//            return usesSignificantDigits
//        }
//        set {
//            usesSignificantDigits = newValue
//        }
//    }
//
//    var minimumSignificantDigits: Int {
//        get {
//            return minimumSignificantDigits
//        }
//        set {
//            minimumSignificantDigits = newValue
//        }
//    }
//
//    var maximumSignificantDigits: Int {
//        get {
//            return maximumSignificantDigits
//        }
//        set {
//            maximumSignificantDigits = newValue
//        }
//    }
//
//    var isPartialStringValidationEnabled: Bool {
//        get {
//            return isPartialStringValidationEnabled
//        }
//        set {
//            isPartialStringValidationEnabled = newValue
//        }
//    }
//
//    var hasThousandSeparators: Bool {
//        get {
//            return hasThousandSeparators
//        }
//        set {
//            hasThousandSeparators = newValue
//        }
//    }
//
//    var thousandSeparator: Str {
//        get {
//            return thousandSeparator
//        }
//        set {
//            thousandSeparator = newValue
//        }
//    }
//
//
//    var paddingPosition: NumberFormatter.PadPosition {
//        get {
//            return paddingPosition
//        }
//        set {
//            paddingPosition = newValue
//        }
//    }
//
//    var roundingMode: NumberFormatter.RoundingMode {
//        get {
//            return roundingMode
//        }
//        set {
//            roundingMode = newValue
//        }
//    }
//
//    var roundingBehavior: NSDecimalNumberHandler {
//        get {
//            return roundingBehavior
//        }
//        set {
//            roundingBehavior = newValue
//        }
//    }




//  /// Return a shared formatter
//   func shared(format: CurrencyFormat = .isoCode,
//                     locale: LID = .current,
//                     roundingMode: NumberFormatter.RoundingMode = .down,
//                     usesGroupingSeparator: Bool = false,
//                     minFractionDigits: Int = 0,
//                     maxFractionDigits: Int = 0) -> MoneyFormatter {
//
//      switch style {
//      case .isoCode:
//          fatalError()
//          //numberCurrencyStyle = .currency
//
//      case .singular:
//          fatalError()
//          //numberCurrencyStyle = .currency
//
//      case .plural:
//          numberCurrencyStyle = .currencyPlural
//      }
//
//      locale = locale
//      roundingMode = roundingMode
//      usesGroupingSeparator = usesGroupingSeparator
//      minimumFractionDigits = minFractionDigits
//      maximumFractionDigits = maxFractionDigits
//      return numFormatter
//  }


//
//    class func defaultFormatterBehavior() -> NumberFormatter.Behavior
//
//    class func setDefaultFormatterBehavior(_ behavior: NumberFormatter.Behavior)


//     var perMillSymbol: Str!

//     var minusSign: Str!
//     var plusSign: Str!
//     var exponentSymbol: Str!

//  var formatterBehavior: NumberFormatter.Behavior

//     var negativeFormat: Str!
//
//     var textAttributesForNegativeValues: [Str : Any]?
//
//     var positiveFormat: Str!
//
//     var textAttributesForPositiveValues: [Str : Any]?

//     var zeroSymbol: Str?
//
//     var textAttributesForZero: [Str : Any]?
//
//     var nilSymbol: Str
//
//     var textAttributesForNil: [Str : Any]?
//
//     var notANumberSymbol: Str!
//
//     var textAttributesForNotANumber: [Str : Any]?
//
//     var positiveInfinitySymbol: Str
//
//     var textAttributesForPositiveInfinity: [Str : Any]?
//
//     var negativeInfinitySymbol: Str
//
//     var textAttributesForNegativeInfinity: [Str : Any]?

//     var positivePrefix: Str!
//
//     var positiveSuffix: Str!
//
//     var negativePrefix: Str!
//
//     var negativeSuffix: Str!

//     var minimum: NSNumber?
//     var maximum: NSNumber?

//     var localizesFormat: Bool {}
//     var format: Str {}
