

import MinimalBase


public protocol CurrencyP {
    
    /// full currency name, for ex. dollar
    var name: String? {get}
    
    /// ISO currency code, for ex. USD
    var code: String { get }
    
    /// Scale of currency's minor unit
    /// For example, the US Dollar (USD) has a minor unit (cents)
    /// equal to 1/100 of a dollar, and therefore takes 2 decimal places.
    /// The Japanese Yen (JPY) doesn't have a minor unit, and therefore takes 0 decimal places.
    var scale: Int { get }
    
    /// The currency symbol
    var symbol: String { get }
}

public extension CurrencyP {

    /// returns localized name of the language
    func currencyName(for locale: Locale) -> String {
        //TODO: test
        return locale.localizedString(forCurrencyCode: code)!
    }
}
