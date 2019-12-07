

public protocol MoneyFormatterP: class, HasMoneyFormatP, HasCurrencyP, HasLID {
    
    /// numbers are spelled out as words
    var spellOutNumbers: Bool {get set}
    
    init(currency: Currency, _ format: MoneyFormat)
}

public final class MoneyFormatter: MoneyFormatterP {
    
    var numFormatter = NumberFormatter()
    
    /// numbers are spelled out as words
    public var spellOutNumbers: Bool
    
    /// default values are USD and US, allowing to init() with empty args
    public init(currency: Currency = .USD,
                _ format: MoneyFormat = .US_code) {
        self.spellOutNumbers = format.spellOutNumbers
        self.currency = currency
        self.format = format
    }
}
public extension MoneyFormatter {
    
    /// Note: not all Locales are supported, for ex. those without country indication, like .english are not
    convenience init?(currency: Currency,
                     currencyFormat: CurrencyFormat,
                     spellOutNumbers: Bool = false,
                     roundingMode: NumRoundingMode = .down,
                     usesGroupingSeparator: Bool = false,
                     minFractionDigits: Int = 0,
                     maxFractionDigits: Int = 10,
                     _ lid: LID) {
        
        guard let format = MoneyFormat(currencyFormat: currencyFormat,
                                 spellOutNumbers: spellOutNumbers,
                                 roundingMode: roundingMode,
                                 usesGroupingSeparator: usesGroupingSeparator,
                                 minFractionDigits: minFractionDigits,
                                 maxFractionDigits: maxFractionDigits,
                                 lid) else {
            return nil
        }
        self.init(currency: currency, format)
    }
    
    // HasMoneyFormatP
    var format: MoneyFormat {
        get  {
            MoneyFormat(currencyFormat: currencyFormat,
                        spellOutNumbers: spellOutNumbers,
                        roundingMode: roundingMode,
                        usesGroupingSeparator: usesGroupingSeparator,
                        minFractionDigits: minFractionDigits,
                        maxFractionDigits: maxFractionDigits,
                        lid)!
        }
        set {
            spellOutNumbers = newValue.spellOutNumbers
            
            currencyFormat = newValue.currencyFormat
            //currencyCode = newValue.currencyCode // locale.currencyCode
            //currencySymbol = newValue.currencySymbol // locale.currencySymbol
            
            minFractionDigits = newValue.minFractionDigits
            maxFractionDigits = newValue.maxFractionDigits
            usesGroupingSeparator = newValue.usesGroupingSeparator
            roundingMode = newValue.roundingMode
            
            setLocale(newValue.lid)
        }
    }
}
