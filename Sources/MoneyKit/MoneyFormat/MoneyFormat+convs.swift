



public extension MoneyFormat {
    
    /// .spellOut or .decimal
    var numFormat: NumFormat {
        spellOutNumbers ? .spellOut : .decimal
    }
    
    // NumFormatterStyleConvertibleT
    var numStyle: NumFormatterStyle {
        numFormat.numStyle
    }
    
    
    //MARK: - cotrs
    
    /// USD symbol, for ex "5 USD"
    static var US_code: MoneyFormat {
        MoneyFormat(currencyFormat: .isoCode,.englishUS)!
    }
    ///$ symbol, for ex "$5"
    static var US_symbol: MoneyFormat {
        MoneyFormat(currencyFormat: .symbol,.englishUS)!
    }
    /// English language, words, US formatting, for ex "5 US dollars"
    static var US_words: MoneyFormat {
        MoneyFormat(currencyFormat: .words,.englishUS)!
    }
    
    //TODO:
    // more cotrs
    // consider making ext on Double to make Money using these
    // for ex 1.5.USD_words, etc
    
    //MARK: - supported locales
    
    static func supports(_ lid: LID) -> Bool {
        lid.canBeUsedForCurrencies
    }
    
    static var supportedLIDs: Set<LID> {
        LID.allForms.filter {supports($0)}.set
    }
    static var unsupportedLIDs: Set<LID> {
        LID.allForms.filter { !supports($0) }.set
    }
    
    
    static var allForms: Set<Self> {
        CurrencyFormat.allForms.map { currencyFormat in
            supportedLIDs.map { lid in
                //TODO:
                // spellOut
                //roundingMode: NumRoundingMode = .down,
                //usesGroupingSeparator: Bool = false,
                //usesGroupingSeparator: Bool = false,
                //minFractionDigits: Int = 0,
                //maxFractionDigits: Int = 10,
                Self(currencyFormat: currencyFormat, lid)!
            }
        }.flatMap{$0}.set
    }
}

