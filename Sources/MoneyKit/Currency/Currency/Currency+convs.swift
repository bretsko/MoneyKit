
@_exported import LocalBase


public extension Currency {
    
    /// inits with ISO currency code
    init?(isoCode: Str) {
        self.init(rawValue: isoCode)
    }
    
    /// ISO currency code
    var isoCode: Str {
        rawValue
    }
    
    var countries: Set<CountryL> {
        CountryL.allForms.filter{$0.currency == self}.set
    }
    
    /// currencySymbol
    var symbol: Str {
        nslocale.currencySymbol
    }
    
    var nslocale: NSLocale {
        let idFromComponents = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.currencyCode.rawValue: rawValue])
        let canonical = NSLocale.canonicalLocaleIdentifier(from: idFromComponents)
        return NSLocale(localeIdentifier: canonical)
    }
    
    var locale: Locale {
        nslocale as Locale
    }
    
    func formatter(_ format: MoneyFormat = .US_code) -> MoneyFormatter {
        .shared(currency: self, format)
    }
}


//TODO: more data
//public extension Currency {
//
/// Scale of currency's minor unit
/// For example, the US Dollar (USD) has a minor unit (cents)
/// equal to 1/100 of a dollar, and therefore takes 2 decimal places.
/// The Japanese Yen (JPY) doesn't have a minor unit, and therefore takes 0 decimal places.
//    var scale: Int {
//        NumberFormatter(self).maxFractionDigits
//    }
//
//    /// name of the coin / minor unit
//    var minorUnit: Str {
//        //TODO: switch -> Str
//        fatalError()
//    }
//
//    /// country names in which it's used
//    var countries: [Str] {
//        //TODO: switch -> [Str]
//        fatalError()
//    }
//}

