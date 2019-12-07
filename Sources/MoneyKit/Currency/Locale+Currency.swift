

public extension Locale {
    
    /// uses iOS commonISOCurrencyCodes list
    static var commonCurrencies: Set<Currency> {
        commonISOCurrencyCodes
            .map{ Currency(isoCode: $0)! }.set
    }
}

public extension LID {
    
    /// uses iOS commonISOCurrencyCodes list
    static var commonCurrencies: Set<Currency> {
        Locale.commonCurrencies
    }
    
    /// Returns a list of common `LID` currency codes.
    static var commonISOCurrencyCodes: [Str] {
        Locale.commonISOCurrencyCodes
    }
    
    /// Returns a list of available `LID` currency codes.
    static var isoCurrencyCodes: [Str] {
        Locale.isoCurrencyCodes
    }
}
