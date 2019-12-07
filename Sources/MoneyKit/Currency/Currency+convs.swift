

public extension Currency {
    
    /// ISO currency code
    var code: String {
        return rawValue
    }
    
    /// full currency name
    var name: String? {
        return nslocale.localizedString(forCurrencyCode: code)
    }
    
    /// Scale of currency's minor unit
    /// For example, the US Dollar (USD) has a minor unit (cents)
    /// equal to 1/100 of a dollar, and therefore takes 2 decimal places.
    /// The Japanese Yen (JPY) doesn't have a minor unit, and therefore takes 0 decimal places.
    var scale: Int {
        return formatter().maximumFractionDigits
    }
    
    var nslocale: NSLocale {
        let idFromComponents = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.currencyCode.rawValue: rawValue])
        let canonical = NSLocale.canonicalLocaleIdentifier(from: idFromComponents)
        return NSLocale(localeIdentifier: canonical)
    }
    
    var locale: Locale {
        return nslocale as Locale
    }
    
    /// currencySymbol
    var symbol: String {
        return nslocale.currencySymbol
    }
}
