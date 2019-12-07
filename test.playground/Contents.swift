import MoneyKit

let code = "NOK"
let idFromComponents = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.currencyCode.rawValue: code])
let canonical = NSLocale.canonicalLocaleIdentifier(from: idFromComponents)
let nslocale = NSLocale(localeIdentifier: canonical)// "nb_NO")
//let locale = Locale(identifier: "ru")// "nb_NO")
let symbol = nslocale.currencySymbol

// ["en", "en-US", "uk-US", "sv-US", "nb-US", "nb", "uk", "ru"]
let preferredLanguages: [String] = Locale.preferredLanguages.map{
    if let i =  $0.firstIndex(of: "-") {
        return String($0.prefix(upTo: i))
    } else {
        return nil
    }
}.compactMap({$0})
print(preferredLanguages)

let preferredRegions: [String] = Locale.preferredLanguages.map{
    if let i =  $0.firstIndex(of: "-") {
        return String($0.suffix(from: $0.index(after: i)))
    } else {
        return nil
    }
    }.compactMap({$0})
print(preferredRegions)


let locale = Locale(identifier: "sv-US")
print(locale.identifier)
print(locale.collatorIdentifier!)
print(locale.languageCode!)
print(locale.regionCode!)

//print(NumberFormatter.localizedString(from: 1, number: .currencyPlural))

print(locale.localizedString(forRegionCode: "UA")!)
print(locale.localizedString(forCurrencyCode: "USD")!)
//print(locale.localizedString(forCurrencyCode: "NOK"))

let fmtr = NumberFormatter()
fmtr.locale = Locale.current //locale
fmtr.numberStyle = .currency //.currency
fmtr.currencyCode = code
fmtr.currencySymbol = symbol

let scale = fmtr.maximumFractionDigits
print(scale)

fmtr.string(from: 2)

print(fmtr.internationalCurrencySymbol)
print(fmtr.currencySymbol)

fmtr.string(from: 2)

