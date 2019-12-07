

public extension MoneyFormatter {
    private static let _shared = MoneyFormatter()
    
    
    /// default values are USD and US, allowing to init() with empty args
    static func shared(currency: Currency = .USD,
                       _ format: MoneyFormat = .US_code) -> MoneyFormatter {
        let fmtr = _shared
        fmtr.currency = currency
        fmtr.format = format
        return fmtr
    }
    
    /// Note: not all Locales are supported, for ex. those without country indication, like .english are not
    static func shared(currency: Currency,
                       currencyFormat: CurrencyFormat,
                       spellOutNumbers: Bool = false,
                       roundingMode: NumRoundingMode = .down,
                       usesGroupingSeparator: Bool = false,
                       minFractionDigits: Int = 0,
                       maxFractionDigits: Int = 10,
                       _ lid: LID = .englishUS) -> MoneyFormatter? {
        
        guard let format = MoneyFormat(currencyFormat: currencyFormat,
                                       spellOutNumbers:spellOutNumbers,
                                       roundingMode:roundingMode,
                                       usesGroupingSeparator:usesGroupingSeparator,
                                       minFractionDigits:minFractionDigits,
                                       maxFractionDigits:maxFractionDigits,
                                       lid) else {
            return nil
        }
        return shared(currency: currency, format)
    }
}
