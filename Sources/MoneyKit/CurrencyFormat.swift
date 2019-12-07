



/// Currency Formatting Style
/// see https://developer.apple.com/documentation/foundation/numberformatter/style
public enum CurrencyFormat: Str, StrEnumT, NumFormatterStyleConvertibleT {
    
    /// = NumberFormatter.Style.currency
    ///US: $1,234.57
    ///FR: 1 234,57 €
    ///CN: ￥1,234.57
    case symbol
    
    ///US: USD1,234.57
    ///FR: 1 234,57 EUR
    ///CN: CNY1,234.57
    case isoCode
    
    ///US: 1,234.57 US dollars
    ///FR: 1 234,57 euros
    ///CN: 1,234.57人民币
    case words
    
    
    //TODO: can remove (in some cases only!) prefix s from NumberFormatter.Style.currencyPlural
    ///US: $1,234.57
    ///FR: 1 234,57 €
    ///CN: ￥1,234.57
    //case singular
    
    // = "(currency)"
    //case currencyAccounting
}


public extension CurrencyFormat {
    
    // NumFormatterStyleConvertibleT
    var numStyle: NumFormatterStyle {
        switch self {
        case .symbol:
            return .currency
        case .isoCode:
            return .currencyISOCode
        case .words:
            return .currencyPlural
        }
    }
}


public protocol HasCurrencyFormatP {
    
    var currencyFormat: CurrencyFormat {get set}
}
