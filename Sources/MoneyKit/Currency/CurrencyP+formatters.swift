

import MinimalBase


public extension CurrencyP {
    
    func formatter(style: MoneyFormatter.Style = .code,
                   minDecimalDigits: Int? = nil,
                   maxDecimalDigits: Int? = nil,
                   _ locale: Locale = .current) -> MoneyFormatter {
        
        return MoneyFormatter.shared(style: style,
                                     currencyCode: code,
                                     currencySymbol: symbol,
                                     minDecimalDigits: minDecimalDigits,
                                     maxDecimalDigits: maxDecimalDigits,
                                     locale)
    }
}

