
public protocol CurrencyP: StrEnumP, HasLocale {
    
    /// Returns a localized full currency name for a specified ISO 4217 currency code.
    /// For example, in the "en" locale, the result for `"USD"` is `"US Dollar"`.
    /// If locale is not provided extracts it from the currency using canonical values
    /// Note: not all Locales are supported, for ex. those without country indication, like .english are not
    func name(for locale: Locale?) -> Str
    
    /// ISO currency code, for ex. USD
    var isoCode: Str {get}
    
    /// The currency symbol, for ex $ for USD
    var symbol: Str {get}
    
    //TODO:
    /// Scale of currency's minor unit
    /// For example, the US Dollar (USD) has a minor unit (cents)
    /// equal to 1/100 of a dollar, and therefore takes 2 decimal places.
    /// The Japanese Yen (JPY) doesn't have a minor unit, and therefore takes 0 decimal places.
    //var scale: Int { get }
    
    //var country: Str {get}
}
public extension CurrencyP {
    
    //MARK: -
    
    //TODO: either lowercase Dollar, or capitalize in currencyName()
    
    /// Returns a localized full currency name for a specified ISO 4217 currency code.
    /// For example, in the "en" locale, the result for `"USD"` is `"US Dollar"`.
    /// If locale is not provided extracts it from the currency using canonical values
    /// Note: not all Locales are supported, for ex. those without country indication, like .english are not
    func name(for locale: Locale? = nil) -> Str {
        (locale ?? self.locale).localizedString(forCurrencyCode: isoCode)!
    }
    
    /// Returns full currency name in given locale
    /// For example, in the "en" locale, the result for `"USD"` is `"US Dollar"`.
    /// If locale is not provided extracts it from the currency using canonical values
    /// Note: not all Locales are supported, for ex. those without country indication, like .english are not
    /// Check lid.canBeUsedForCurrencies, crashes if false
    func name(for locale: LID? = nil) -> Str {
        name(for: locale?.locale)
    }
}
