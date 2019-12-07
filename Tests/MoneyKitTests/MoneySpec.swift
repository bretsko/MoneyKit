
import Quick
import Nimble
@testable import MoneyKit

class MoneySpec: QuickSpec {
    override func spec() {
        
        describe("Money") {
            
            it("can init") {
                let money = Money(1.0, .USD)
                expect(money.amount).to(equal(1.0))
                expect(money.currency).to(equal(.USD))
            }
            
            it("can init with diff currencies") {
                
                let money1 = Money(1.0, .USD)
                expect(money1.currencyCode).to(equal("USD"))
                expect(money1.currencySymbol).to(equal("US$"))
                
                expect(money1.currencyName(for: .englishUS)).to(equal("US Dollar"))
                expect(money1.currencyName(for: .ukrainianUkraine)).to(equal("долар США"))
                expect(money1.currencyName(for: .russianUkraine)).to(equal("доллар США"))
                
                let money2 = Money(2.0, .UAH)
                expect(money2.currencyName(for: .ukrainianUkraine)).to(equal("українська гривня"))
                expect(money2.currencyCode).to(equal("UAH"))
                expect(money2.currencySymbol).to(equal("UAH"))
            }
            
            
            it("can make Money with diff formats") {
                
                let format = MoneyFormat(currencyFormat: .words,
                                         spellOutNumbers: false,
                                         .englishUS)!
                
                let money = Money(1.0, .USD, format)
                expect(money.format).to(equal(format))
                expect(money.lid).to(equal(.englishUS))
            }
            
            it("supports a limited list of locales") {
                
                expect(LID.englishUS.canBeUsedForCurrencies).to(equal(true))
                
                let wrongLocale = LID.english
                expect(wrongLocale.canBeUsedForCurrencies).to(equal(false))
                
                
                var format = MoneyFormat(currencyFormat: .words,
                                         spellOutNumbers: false,
                                         .englishUS)!
                let money = Money(1.0, .USD, format)
                
                expect(money.format).to(equal(format))
                expect(money.lid).to(equal(.englishUS))
                
                expect(format.setLocale(.ukrainianUkraine)).to(equal(true))
                expect(format.setLocale(.russianUkraine)).to(equal(true))
                format.setLocale(.russianUkraine)
                
                expect(MoneyFormat(wrongLocale)).to(beNil())
                expect(format.setLocale(wrongLocale)).to(equal(false))
            }
            
            it("can transl Money with correct plural and singular forms") {
                
                let format = MoneyFormat(currencyFormat: .words,
                                         spellOutNumbers: false,
                                         .englishUS)!
                
                var money = Money(1.0, .USD, format)
                
                //TODO:
                // fix Dollar vs dollar - for singular vs plural
                // check which other currencies produce diff casing
                expect(money.str).to(equal("1 US Dollar"))
                
                money.amount = 1.1
                expect(money.str).to(equal("1.1 US Dollars"))
                
                money.amount = 2.0
                expect(money.str).to(equal("2 US Dollars"))
            }
            
            it("can transl Money in diff locales") {
                
                let format = MoneyFormat(currencyFormat: .words,
                                         spellOutNumbers: true,
                                         .englishUS)!
                
                var money = Money(1.0, .USD, format)
                
                money.amount = 1
                money.setLocale(.russianUkraine)
                expect(money.str).to(equal("один доллар США"))
                
                money.setLocale(.ukrainianUkraine)
                expect(money.str).to(equal("один долар США"))
                
                money.amount = 2
                money.setLocale(.russianUkraine)
                //TODO: двe
                // make (украинской) optional or remove
                expect(money.str).to(equal("два доллара США")) //два украинской гривны
                
                //money.setLocale(.ukrainianUkraine)
                //TODO: дві
                //expect(money.str).to(equal("два гривні"))
                
                
                //money.amount = 5
                //money.setLocale(.russianUkraine)
                //TODO: гривен
                // change to украинских and make optional OR better remove!
                //expect(money.str).to(equal("пять украинской гривны"))
                
                //money.setLocale(.ukrainianUkraine)
                //TODO: гривень
                //expect(money.str).to(equal("пʼять гривні"))
            }
            
            it("can spell out numbers") {
                
                let moneyFormat = MoneyFormat(currencyFormat: .words,
                                              spellOutNumbers: true,
                                              .englishUS)!
                
                var money = Money(1.0, .USD, moneyFormat)
                expect(money.amount).to(equal(1.0))
                
                expect(money.str).to(equal("one US Dollar"))
                
                money.setLocale(.russianUkraine)
                expect(money.str).to(equal("один доллар США"))
                
                money.setLocale(.ukrainianUkraine)
                expect(money.str).to(equal("один долар США"))
            }
            
            
            
            //            it("can provide localized name for currency") {
            //
            //                var money = Money(1.0, .USD)
            //                let str1 = money.currency.currencyName(for: .englishUnitedStates)
            //                expect(str1).to(equal("US Dollar"))
            //
            //                let str2 = money.currency.currencyName(for: .ukrainian)
            //                print(str2)
            //                expect(str2).to(equal("долар США"))
            //
            //                let str3 = money.currency.currencyName(for: .russian)
            //                print(str3)
            //                expect(str3).to(equal("доллар США"))
            //
            //                money.amount = 2.0
            //
            //                let str4 = money.str
            //                print(str4)
            //expect(str1).to(equal("US Dollar"))
            //
            //                let str5 = money.currency.currencyName(for: .ukrainian)
            //                print(str2)
            //                //expect(str2).to(equal("долар США"))
            //
            //                let str6 = money.currency.currencyName(for: .russian)
            //                print(str3)
            //expect(str3).to(equal("доллар США"))
            // }
            
            //TODO:
            // it("can convert ") {
            // }
            
            
            //TODO:
            //            it("can init with minor units") {
            //
            //                let money = Money(minorUnits: 25, .USD)
            //                expect(money.value).to(equal(0.25))
            //            }
        }
    }
}
