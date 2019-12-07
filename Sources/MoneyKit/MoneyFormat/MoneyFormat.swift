

typealias MoneyFormatT = HasAllFormsT & HasCurrencyFormatP & HasLID

public struct MoneyFormat: MoneyFormatT {
    
    public var currencyFormat: CurrencyFormat
    
    /// if true prints money numbers with words, otherwise as normal numbers
    ///US: one hundred twenty-three
    ///FR: cent vingt-trois
    ///CN: 一百二十三
    public var spellOutNumbers: Bool
    
    public var roundingMode: NumRoundingMode
    public var usesGroupingSeparator: Bool
    public var minFractionDigits: Int
    public var maxFractionDigits: Int
    
    var _lid: LID
}

public extension MoneyFormat {
    
    /// Note: not all Locales are supported, for ex. those without country indication, like .english are not
    /// Check lid.canBeUsedForCurrencies
    init?(currencyFormat: CurrencyFormat = .isoCode,
          spellOutNumbers: Bool = false,
          roundingMode: NumRoundingMode = .down,
          usesGroupingSeparator: Bool = false,
          minFractionDigits: Int = 0,
          maxFractionDigits: Int = 10,
          _ lid: LID = .englishUS) {
        
        guard Self.supports(lid) else {
            return nil
        }
        self._lid = lid
        
        self.currencyFormat = currencyFormat
        self.spellOutNumbers = spellOutNumbers
        self.roundingMode = roundingMode
        self.usesGroupingSeparator = usesGroupingSeparator
        self.minFractionDigits = minFractionDigits
        self.maxFractionDigits = maxFractionDigits
    }
    
    //MARK: - locale
    
    var lid: LID {
        _lid
    }
    
    /// Note: not all Locales are supported, for ex. those without country indication, like .english are not
    /// Check lid.canBeUsedForCurrencies
    @discardableResult
    mutating func setLocale(_ locale: LID) -> Bool {
        guard Self.supports(locale) else {
            return false
        }
        _lid = locale
        return true
    }
}

