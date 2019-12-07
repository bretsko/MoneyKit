



public protocol HasMoneyFormatP: HasCurrencyFormatP {
    
    var format: MoneyFormat {get set}
}

public extension HasMoneyFormatP {
    

    //HasCurrencyFormatP
    var currencyFormat: CurrencyFormat {
        get {
            format.currencyFormat
        }
        set {
            format.currencyFormat = newValue
        }
    }
    
    var spellOutNumbers: Bool {
        get  {
            format.spellOutNumbers
        }
        set {
            format.spellOutNumbers = newValue
        }
    }
    
    
    //MARK: -
    
    var lid: LID {
        format.lid
    }
    
    /// not all Locales are supported, for ex. those without country indication, like .english are not
    @discardableResult
    mutating func setLocale(_ locale: LID) -> Bool {
        format.setLocale(locale)
    }
    
    
    //MARK: -

    var roundingMode: NumRoundingMode {
        get  {
            format.roundingMode
        }
        set {
            format.roundingMode = newValue
        }
    }
    
    var usesGroupingSeparator: Bool {
        get  {
            format.usesGroupingSeparator
        }
        set {
            format.usesGroupingSeparator = newValue
        }
    }
    
    var minFractionDigits: Int {
        get  {
            format.minFractionDigits
        }
        set {
            format.minFractionDigits = newValue
        }
    }
    
    var maxFractionDigits: Int {
        get  {
            format.maxFractionDigits
        }
        set {
            format.maxFractionDigits = newValue
        }
    }
}







