

public extension MoneyFormatter {
    
    /// Returns full currency name in given locale
    /// For example, in the "en" locale, the result for `"USD"` is `"US Dollar"`.
    static func currencyName(_ currency: Currency,
                             plurality: CurrencyPlurality = .singular,
                             _ lid: LID) -> Str {
        
        NumberFormatter.currencyName(currencyCode: currency.isoCode,
                                     currencySymbol: currency.symbol, plurality: plurality, lid)
    }
}


//MARK: -

public extension NumberFormatter {
    
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
    
    /// does not nullify
    var currencyFormat: CurrencyFormat? {
        get {
            CurrencyFormat(numberStyle)
        }
        set {
            if let a = newValue?.numStyle {
                numberStyle = a
            }
        }
    }
}


/// Returns full currency name in given locale
/// For example, in the "en" locale, the result for `"USD"` is `"US Dollar"`.
/// If locale is not provided extracts it from the currency using canonical values
/// Note: not all Locales are supported, for ex. those without country indication, like .english are not
/// Check lid.canBeUsedForCurrencies, crashes if false
//    func currencyName(_ money: MoneyP) -> Str {
//        switch money.currencyPlurality {
//        case .singular: // 1 доллар
//            return currency.name(for: locale)
//        case .twoThreeFour: // 2,3,4 доллара
//            return currencyWords(from: 2)
//        case .plural: // 6 долларов
//            return currencyWords(from: 6)
//        }
//    }



