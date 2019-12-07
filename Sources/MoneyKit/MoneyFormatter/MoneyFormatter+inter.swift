

public extension MoneyFormatter {
    
    //TODO: func to get all possible Moneys (Set)
    
    /// if currency, style or locale are not provided - uses currently set, otherwise overrides them with given
    func money(from str: Str,
               possibleCurrencies: Set<Currency> = Currency.allForms,
               possibleStyles: Set<CurrencyFormat> = CurrencyFormat.allForms,
               _ possibleLIDs: Set<LID> = LID.allForms) -> Money? {
        
        fatalError()
        //        self.lid = lid
        //        if let style = style {
        //            numStyle = style.numStyle
        //        }
        //        if let currency = currency {
        //            currencyCode = currency.isoCode
        //            currencySymbol = currency.symbol
        //
        //            if let value = numFormatter.number(from: str) {
        //                return Money(value, currency)
        //            }
        //            return nil
        //        }
        //
        //        //TODO: bruteforce all currencies, locales ??
        //        for currency in Currency.allCases {
        //            setup(with: currency)
        //            guard let value = numFormatter.number(from: str) else {
        //                continue
        //            }
        //            return Money(value, currency)
        //        }
        //        return nil
    }
    
    
    //TODO: can bruteforce
    /// if style is not provided - tries all styles
    static func money(from string: Str,
                      currency: Currency? = nil,
                      format: CurrencyFormat? = nil,
                      _ locale: LID = .current) -> Money? {
        
        //        let fmtr = shared(style: style, currencyCode: currency?.isoCode, currencySymbol: currency?.symbol, minFractionDigits: minFractionDigits, maxFractionDigits: maxFractionDigits, locale)
        //
        //        guard let currency = Currency.allCases.first(where: {
        //
        //            if let numFormatter.number(from: string)
        //
        //        }) else {
        //            return nil
        //        }
        
        fatalError()
        //TODO: bruteforce all currenies, locales ??
        // setup formatter based on  money.currency
        // then make Money with this data
        //return number(from: string)
    }
    
    
    //MARK: -
    
    //TODO: consider adding currency as arg
    func currencyFrom(moneyString: Str) -> Currency? {
        fatalError()
        //TODO: bruteforce all currenies, locales ??
        // setup formatter based on  money.currency
        //return number(from: string)
        // then return the currency
    }
    
    
    //TODO: consider moving this to NumberFormatter ext in MinimalBase
    func double(from numStrings: [Str]) -> Double? {
        
        //numFormatter.locale = locale
        numFormatter.number(from: numStrings.joinedWords)?.doubleValue
        
        //TODO: try make func to collect the biggest match, without knowing the indices
        //
        //        var numStrings = [Str]()
        //
        //
        //                .enumerated().filter{ (idx, _) in
        //                    idx < words.len - 1
        //            }.map{$0.element}
        //
        //        //TODO: make func on
        //        //can be 2 or many words, "fifty five kilograms"
        //        for (i, word) in words.enumerated() {
        //
        //            // append all elements except last
        //            if i < words.len - 1 {
        //                numStrings.append(word)
        //            }
        //        }
    }
    
    
    //TODO: try make the same
    
    
    //MARK: - inter
    
    //    open func inter(_ str: Str,
    //                    min: Double = 1,
    //                    max: Double = 1000,
    //                    step: Double = 1,
    //                    possibleCurrencies: Set<Currency> = Currency.allForms,
    //                    _ possibleFormats: Set<MoneyFormat> = MoneyFormat.allForms) -> Money? {
    //
    //        for format in possibleFormats {
    //            switch format.numFormat {
    //            case .spellOut:
    //                setFormat(format)
    //
    //                let words = str.words!
    //
    //                /// expect at least "five kilograms"
    //                guard words.len >= 2 else {
    //                    continue // for loop
    //                }
    //
    //                guard let unitStr = words.last,
    //                      let unit = MoneyUnit(unitStr, format.unitFormat, possibleUnits: possibleUnits) else {
    //                    continue // for loop
    //                }
    //
    //                let numStrs = words.dropLast(1).array
    //
    //                guard let num = parseNum(from: numStrs) else {
    //                    continue // for loop
    //                }
    //                return .init(unit, num)
    //
    //            default:
    //
    //                //TODO: try make func
    //                return Money.generate(min: min, max: max,
    //                                        step:step,
    //                                        possibleUnits:possibleUnits,
    //                                        possibleFormats).first(where: {
    //                                            $0.str == str
    //                                        })
    //            }
    //        }
    //        return nil
    //    }
    //
    //    open func inter(_ str: Str,
    //                    min: Double = 1,
    //                    max: Double = 1000,
    //                    step: Double = 1,
    //                    _ unit: MoneyUnit,
    //                    _ format: MoneyFormat) -> Money? {
    //        setFormat(format)
    //        return Money.generate(min: min, max: max,
    //                                step:step, unit, format).first(where: {
    //                                    $0.str == str
    //                                })
    //    }
    
    //MARK: - inter
    
    //    init?(_ str: Str,
    //          min: Double = 1,
    //          max: Double = 1000,
    //          step: Double = 1,
    //          possibleUnits: Set<MoneyUnit> = MoneyUnit.allForms,
    //          _ possibleFormats: Set<MoneyFormat> = MoneyFormat.allForms) {
    //
    //        let m = MoneyFormatter.shared()
    //        if let a = m.inter(str,
    //                           min:min, max:max, step:step,
    //                           possibleUnits: possibleUnits,
    //                           possibleFormats) {
    //            self = a
    //        } else {
    //            return nil
    //        }
    //    }
    //
    //    init?(_ str: Str,
    //          min: Double = 1,
    //          max: Double = 1000,
    //          step: Double = 1,
    //          possibleUnits: Set<MoneyUnit> = MoneyUnit.allForms,
    //          _ format: MoneyFormat = MoneyFormat()) {
    //        self.init(str, min: min, max: max, step: step,
    //                  possibleUnits: possibleUnits,
    //                  Set([format]))
    //    }
    //
    //    /// if the Str represents any money in given range, locale(s), etc - it is returned
    //    init?(_ str: Str,
    //          min: Double = 1,
    //          max: Double = 1000,
    //          step: Double = 1,
    //
    //          possibleUnits: Set<MoneyUnit> = MoneyUnit.allForms,
    //          unitStyle: MeasUnitStyle = .medium,
    //          numFormat: NumFormat = .decimal,
    //          _ locale: LID = .englishUnitedStates) {
    //        self.init(str,
    //                  min:min, max:max, step:step,
    //                  possibleUnits:possibleUnits,
    //                  MoneyFormat(unitStyle: unitStyle,
    //                                numFormat: numFormat,
    //                                locale))
    //    }
    
    //??
    //     func stringFromMoney(with currency: CurrencyP,
    //                                value: Decimal) -> Str? {
    //        fatalError()
    //        //TODO: setup formatter based on  money.currency
    //        //return string(from: money.value)
    //    }
    
    
}

private extension MoneyFormatter {
    
    func number(from str: Str) -> NSNumber? {
        numFormatter.number(from: str)
    }
    
    
    //ISO
    static func localizedString(from value: Decimal,
                                _ format: CurrencyFormat) -> Str {
        NumberFormatter.localizedString(from: value as NSNumber,
                                        number: format.numStyle)
    }
    
    
    //MARK: bruteforcers
    
    /// uses provided list of currencies, styles, locales - to try identify currency, and returns the first match
    /// if currency, style or locale are not provided - uses all possible values set, otherwise overrides them with given
    //     static func money(from string: Str,
    //                             possibleCurrencies: Set<Currency> = Currency.allCases,
    //                             possibleStyles: Set<CurrencyFormat> = CurrencyFormat.allCases,
    //                             _ possibleLocales: Set<LID> = LID.allCases) -> Money? {
    //
    //        fatalError()
    //    }
    
    
    //     static func string(from money: MoneyP) -> Str? {
    //        setup(with: money)
    //        return string(from: money.value.nsDecimal)
    //    }
}
