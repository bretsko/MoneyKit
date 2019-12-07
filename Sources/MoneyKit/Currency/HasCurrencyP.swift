



public protocol HasCurrencyP {
    
    var currency: Currency {get}
}

public extension HasCurrencyP {
    
    /// The currency ISO code
    var currencyCode: Str {
        currency.isoCode
    }
    
    /// The currency symbol
    var currencySymbol: Str {
        currency.symbol
    }
    
    /// Returns full currency name in given locale
    /// For example, in the "en" locale, the result for `"USD"` is `"US Dollar"`.
    /// If locale is not provided extracts it from the currency using canonical values
    /// Note: not all Locales are supported, for ex. those without country indication, like .english are not
    /// Check lid.canBeUsedForCurrencies, crashes if false
    func currencyName(for locale: Locale? = nil) -> Str {
        currency.name(for: locale)
    }
    
    /// Returns full currency name in given locale
    /// For example, in the "en" locale, the result for `"USD"` is `"US Dollar"`.
    /// If locale is not provided extracts it from the currency using canonical values
    /// Note: not all Locales are supported, for ex. those without country indication, like .english are not
    /// Check lid.canBeUsedForCurrencies, crashes if false
    func currencyName(for locale: LID? = nil) -> Str {
        currencyName(for: locale?.locale)
    }
}



//TODO: ?
//    /// Scale of currency's minor unit
//    /// For example, the US Dollar (USD) has a minor unit (cents)
//    /// equal to 1/100 of a dollar, and therefore takes 2 decimal places.
//    /// The Japanese Yen (JPY) doesn't have a minor unit, and therefore takes 0 decimal places.
//    var scale: Int {
//        currency.scale
//    }

//    /// ISO currency code
//    var isoCode: Str {
//        currency.isoCode
//    }
//
//


