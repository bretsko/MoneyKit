

public extension MoneyFormatter {
    
    func string(from money: MoneyP) -> Str {
        // numformatter with given locale can only produce currencies in native lang, for ex UAH can be only in Ukrainian, even though currency code is set different
        setup(with: money)
        
        let amount = money.amount
        // let format = money.format
        
        let numStr = self.numStr(from: amount)
        
        //ios bug: produces plural form for 1
        //if format.currencyFormat == .words, amount == 1 {
        //TODO: decimal, and 1.0 - 1.9, etc
        
        let currencyStr = Self.currencyName(money.currency,
                                            plurality: money.currencyPlurality,
                                            money.lid)
        
        return numStr + " " + currencyStr
        //        }
        //
        //        let str = numFormatter.string(from: NSNumber(value: amount))!
        //
        //        if spellOutNumbers {
        //            // ios doesnt support plural
        //
        //            // case 1: one USD
        //            // case 2: two USDs ?
        //            // case 3: one dollar / USD dollar
        //            // case 4: two dollars / USD dollars
        //
        //            // consider using currencyWords
        //            let words = str.words!
        //
        //            //            guard words.len > 1,
        //            //                  let num = double(from: words[0]) else {
        //            //                fatalError()
        //            //                //return nil
        //            //            }
        //
        //            let result = [numStr] + words.dropFirst()
        //
        //            return result.joined(separator: " ")
        //
        //            // if money.double == 1 {
        //        } else {
        //            //case .none, .decimal:
        //            // case 1: 1 USD
        //            // case 2: 2 USDs ?
        //            // case 3: 1 dollar / USD dollar
        //            // case 4: 1 dollars / USD dollars
        //
        //            //TODO: decimal, and 1.0 - 1.9, etc
        //            // if money.double == 1.0 {
        //            // // numFormatter incorrectly uses plural form, for ex dolalrs
        //            return str
        //        }
    }
}

extension MoneyFormatter {
    
    func numStr(from num: NSNumber) -> Str {
        NumFormatter.str(from: num, numFormat: format.numFormat, roundingMode: format.roundingMode, usesGroupingSeparator: format.usesGroupingSeparator, minFractionDigits: format.minFractionDigits, maxFractionDigits: format.maxFractionDigits, format.lid)
    }
    
    func numStr(from num: Double) -> Str {
        numStr(from: num as NSNumber)
    }
}


//MARK: - static moneyStr

//    static func moneyStr(from num: NSNumber,
//                         with currency: Currency,
//                         format: MoneyFormat) -> Str {
//        let fmtr = shared()
//        let money = Money(num.doubleValue, currency, format)
//        return fmtr.string(from: money)
//    }
//
//    static func moneyStr(from num: NSNumber,
//                         currency: Currency,
//                         currencyFormat: CurrencyFormat,
//                         _ lid: LID) -> Str {
//        let mformat = MoneyFormat(currencyFormat: currencyFormat,
//                                  lid)
//        let fmtr = shared(currency: currency, mformat)
//        return fmtr.moneyStr(from: num)
//    }
//
//    static func moneyStr(from num: Double,
//                         currency: Currency,
//                         currencyFormat: CurrencyFormat,
//                         _ lid: LID)  -> Str {
//        moneyStr(from: NSNumber(value: num),
//                 currency:currency,
//                 currencyFormat: currencyFormat, lid)
//    }


//MARK: -

//    /// Returns only the currency part, using CurrencyFormat.plural
//    /// For ex "US dollars", "euros", etc
//    /// Note: not all Locales are supported, for ex. those without country indication, like .english are not
//    static func currencyWords(from num: NSNumber,
//                              currency: Currency,
//                              _ lid: LID) -> Str? {
//        guard let fmtr = shared(currency:currency,
//                                currencyFormat: .words,
//                                lid) else {
//            return nil
//        }
//        return fmtr.moneyStr(from: num)
//            .words!
//            .dropFirst()!.array.joined(separator: " ")
//    }
//
//    /// Returns only the currency part, using CurrencyFormat.plural
//    /// For ex "US dollars", "euros", etc
//    /// Note: not all Locales are supported, for ex. those without country indication, like .english are not
//    static func currencyWords(from num: Double,
//                              currency: Currency,
//                              _ lid: LID)  -> Str? {
//        currencyWords(from: NSNumber(value: num),
//                      currency:currency, lid)
//    }

//MARK: - moneyStr

//    func moneyStr(from num: NSNumber) -> Str {
//        numFormatter.string(from: num)!
//    }
//
//    func moneyStr(from double: Double) -> Str {
//        moneyStr(from: NSNumber(value: double))
//    }

//    func setCurrencyFormat(_ format: CurrencyFormat) {
//        numberStyle = format.numStyle
//    }


//MARK: - spellOut

//    /// uses currently set locale in format
//    func spellOut(_ num: NSNumber) -> Str {
//        defer {
//            // reset format
//            currencyFormat = format.currencyFormat
//        }
//        currencyFormat = .plural
//        return numFormatter.string(from: num)!
//    }
//
//    /// uses currently set locale in format
//    func spellOut(_ num: Double) -> Str {
//        spellOut(NSNumber(value: num))
//    }


