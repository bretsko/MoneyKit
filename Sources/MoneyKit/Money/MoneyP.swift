

public protocol MoneyP: HasCurrencyP, HasMoneyFormatP, HasDoubleP {
    
    var amount: Double {get}
}
public extension MoneyP  {
    
    /// displays description for current locale
    var str: Str {
        MoneyFormatter.shared().string(from: self)
    }
    
    var currencyPlurality: CurrencyPlurality {
        if amount == 1 {
            return .singular
        } else if amount > 1 && amount < 5 { //TODO: 1.1, etc
            return .twoThreeFour
        }
        return .plural
    }
}

typealias MoneyT = MoneyP & Comparable & HasStrAndDescrP & Hashable

