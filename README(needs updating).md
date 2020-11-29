[![Swift5 compatible][Swift5Badge]][Swift5Link]
[![SPM compatible][SPMBadge]][SPMLink]

[Swift5Badge]: https://img.shields.io/badge/swift-5-orange.svg?style=flat
[Swift5Link]: https://developer.apple.com/swift/

[SPMBadge]: https://img.shields.io/badge/SPM-compatible-brightgreen.svg
[SPMLink]: https://github.com/apple/swift-package-manager

# Money

Money is a Swift framework for iOS, watchOS, tvOS and OS X. It provides types and functionality to represent, calculate and convert money in the 298 [ISO currencies](https://en.wikipedia.org/wiki/ISO_4217). 

---

## Usage

The Money framework defines the type `Money`, which represents money in the device’s current locale. The following code:

```swift
import Money

let money: Money = 100
print("I'll give \(money) to charity.”)
```

will print out

> I'll give $100.00 to charity 

when the region is set to United States

> I'll give £100.00 to charity

when the region is set to United Kingdom

> I'll give CN¥100.00 to charity

when the region is set to China

You get the idea. See [Localized Formatting](#localized-formatting) for more info.

`Money` is `IntegerLiteralConvertible` and  `FloatLiteralConvertible`. Which means values can be initialized using literal `Int`s and `Double`s as shown in these code snippets.

## Specific Currency

Under the hood, `Money` is a `typealias` for `_Money<Currency.Local>` where `Currency.Local` is a specific `CurrencyP` which represents the currency for the current locale. This means that it is strongly typed to the local currency.

In a similar way, there are 298 foreign currency types supported.

```swift
let pounds: GBP = 99.99
let euros: EUR = 149.50

print(“You have \(pounds / 2) and \(euros + 30)”)
```

> You have £ 50.00 and € 179.50

Because the currencies are typed, it means that they cannot be combined together.

```swift
let money = pounds + euros
```
> Binary operator '+' cannot be applied to operands of type 'GBP' (aka '_Money&lt;Currency.GBP&gt;') and 'EUR' (aka '_Money&lt;Currency.EUR&gt;')

Of course, `Money` supports the usual suspects of decimal arithmetic operators, so you can add, subtract, multiply, divide values of the same type, and values with `Int` and `Double` with the expected limitations.

## Convenience initializers

`Money` (and its friends) can be initialized with `Int`s (and friends) and`Double`s.

```swift
let anIntegerFromSomewhereElse: Int = getAnInteger()
let money = Money(anIntegerFromSomewhereElse)

let aDoubleFromSomewhere: Double = getAnotherDouble()
let pounds = GBP(aDoubleFromSomewhere)
```

### Minor Units

`Money` can be initialized using the smallest units of currency:

```swift
let dollars = USD(minorUnits: 3250)
let yuen = JPY(minorUnits: 3000)

print(“You have \(dollars) and \(yuen)”)
```

> You have $32.50 and ¥3,000

## Localized Formatting

When displaying money values, it is important that they be correctly localized for the user. In general, it’s best to use the `Money` type to always work in currency of the user’s current locale.

When printing a `MoneyType` value, the `.description` uses the current locale with `.CurrencyStyle` number style, in conjunction with [`NSNumberFormatter`](https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSNumberFormatter_Class/index.html). The code snippets throughout this README uses `.description` whenever the value of money is printed.

However, to specify a different style for the number formatter, use the `formattedWithStyle` method, like this:

```swift
let money: Money = 99.99
print("She has \(money.formattedWithStyle(.CurrencyPluralStyle))")
```

For an American in Russia, this would print out:
>She has 99,99 Russian roubles

### Working with Locales

A *locale* is the codification of associated regional and linguistic attributes. A locale varies by language and region. Each locale has an [identifier](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes), which is the concatenation of language, country and modifier codes. 

The language code is two or three lowercase letters. English is `en`, French is `fr`. There is a [long list](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes). Some languages are spoken in more than one country, in which case a country code (two uppercase letters) is appended (with an underscore). For example, English in the United States is `en_US`, which is the default locale in the iOS Simulator. English in the United Kingdom is `en_GB`. 

Lastly, a locale identifier can be modified, say for example to set the currency code to “USD”, for Portuguese speaking user in Brazil, the locale identifier would be `pt_BR@currency=USD`.

In total, `NSLocale` has support for ~ 730 distinct locales. Typically when creating a specific `NSLocale` it is done with the locale identifier. The `NSLocale` is like a dictionary with an `objectForKey` method which returns `AnyObject!`.

### Formatting for specific LocaleID

I think `NSLocale` is an amazing class, but it’s very easy to make mistakes, and not that easy to construct. Therefore, to support arbitrary locales, but remove the need for framework consumers to construct locale identifiers, a new `LocaleID` type is provided. This is an enum which means that it is type safe, and indexable for code completion in Xcode. Its cases are all the languages which `NSLocale` supports. For those languages which are spoken in more than one country, there is an associated value of country names of only those counties.

To format money for a specific locale we can use the `LocaleID` enum. The following code uses `LocaleID.Chinese(.China)` to represent the `"zh_CN"` locale.

```swift
let money: Money = 99.99
print("She has \(money.formattedWithStyle(.CurrencyPluralStyle, forLocale: .Chinese(.China)))")
```

Now, for our American in Russia, (or any user with a region set to Russia) we get:
>She has 99.99俄罗斯卢布

In this case, because our type is `Money`, and the user’s region is set to Russia, we’re working with `RUB` currency. But equally, if we need money in a specific currency, we can. Here’s Australian dollars, for a SwissGerman speaking user, in France.

```swift
let dollars: AUD = 39.99
print("You’ll need \((dollars / 2.5).formattedWithStyle(.CurrencyPluralStyle, forLocale: .SwissGerman(.France)))")
``` 
Regardless of the user’s current locale, this will print out:
>You’ll need 16.00 Auschtralischi Dollar


# Creating custom currencies

If your app has its own currency e.g. ⭐️s or 💎s or even 🐝s, you might want to consider making a type for it.

Lets imagine we’re making *Hive.app* - where you compete with your friends to see who can get the biggest hive (measured in number of 🐝s).

To create a custom currency, just conform to `CurrencyP`. 

```swift
protocol HiveCurrencyType: CustomCurrencyType { }

extension Currency {
    final class Bee: HiveCurrencyType {

        static let code: String = "BEES"
        static let symbol: String = "🐝"
        static let scale: Int  = 0
    }
}

typealias Bees = _Money<Currency.Bee>
```

Just make sure that your currency code doesn’t clash with a real one - make it more than three characters to be sure.

Now it’s possible to work with your own app’s currency as a proper money type.

```swift
let bees: Bees = 10_000
print(“I have \(bees)”)
```
> I have 🐝10,000

And of course if you have an IAP for purchasing in-app currency, then I’m sure a custom FX provider would be handy.

Take a look at the example project, [Custom Money](https://github.com/danthorpe/Examples/tree/development/Money/Custom%20Money), for an example of a custom local FX provider to exchange your 🐝s.


## Architectural style
Swift is designed to have a focus on safety, enabled primarily through strong typing. This framework fully embraces this ethos and uses generics heavily to achieve this goal. 

At the highest level *currency* is modeled as a protocol, `CurrencyP`. The protocol defines a few static properties like its symbol, and currency code. Therefore *money* is represented as a decimal number with a generic currency. Additionally, we make `CurrencyP` refine the protocol which defines how the decimal number behaves.

Finally, we auto-generate the code which defines all the currencies and money typealiases.

## Implementation Details

Cocoa has two type which can perform decimal arithmetic, these are `NSDecimalNumber` and `NSDecimal`. `NSDecimal` is faster, but is trickier to work with, and doesn’t have support for limiting the scale of the numbers (which is pretty important when working with currencies).

`DecimalNumberType` is a protocol which refines `SignedNumberType` and defines its own functions, `add`, `subtract` etc to support the arithmetic. It is generic over two types, the underlying storage, and the behaviors.

`DecimalNumberType.DecimalStorageType` exists so that conforming types can utilize either `NSDecimalNumber` or `NSDecimal` as their underling storage type.

`DecimalNumberBehavior` is a protocol which exposes a  [`NSDecimalNumberBehaviors`](https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Protocols/NSDecimalNumberBehaviors_Protocol/) which should be used in calculations. This includes rounding style, scale, and when to throw exceptions.


### `_Money`

The `_Money<C: CurrencyP>` type composes a `_Decimal<C>`. Its behavior is provided via its generic `CurrencyP` which refines `DecimalNumberBehavior`. `_Money` also conforms to `DecimalNumberType` which means that it can also be used with the operators.


## Author
Daniel Thorpe [@danthorpe](https://twitter.com/danthorpe). 

Feel free to get in contact if you have questions, queries, suggestions, or need help. Especially get in contact via an Issue here or on Twitter if you want to add support for another FX service provider.

I wrote an introductory blog post about money [here](http://danthorpe.me/posts/money.html).

## License

Money is available under the MIT license. See the LICENSE file for more info.

## Disclaimer

Usage of this framework prevents the author, Daniel Thorpe, from being held liable for any losses incurred by the user through their use of the framework.
