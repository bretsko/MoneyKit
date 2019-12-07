

public extension CountryL {
    
    var currency: Currency {
        let r: Currency
        switch self {
        case .China:
            r = .CNY
        case .India:
            r = .INR
        case .UnitedStates:
            r = .USD
        case .Indonesia:
            r = .IDR
        case .Pakistan:
            r = .PKR
        case .Brazil:
            r = .BRL
        case .Nigeria:
            r = .NGN
        case .Bangladesh:
            r = .BDT
        case .Russia:
            r = .RUB
        case .Mexico:
            r = .MXN
        case .Japan:
            r = .JPY
        case .Ethiopia:
            r = .ETB
        case .Philippines:
            r = .PHP
        case .Egypt:
            r = .EGP
        case .Vietnam:
            r = .VND
        case .DRCongo: //CongoKinshasa
            r = .CDF
        case .CongoBrazzaville:
            r = .XAF
        case .Germany:
            r = .EUR
        case .Turkey:
            r = .TRY
        case .Iran:
            r = .IRR
        case .Thailand:
            r = .THB
        case .UnitedKingdom:
            r = .GBP
        case .France:
            r = .EUR
        case .Italy:
            r = .EUR
        case .SouthAfrica:
            r = .ZAR
        case .Tanzania:
            r = .TZS
        case .Myanmar:
            r = .MMK
        case .Kenya:
            r = .KES
        case .SouthKorea:
            r = .KRW
        case .Colombia:
            r = .COP
        case .Spain:
            r = .EUR
        case .Argentina:
            r = .ARS
        case .Uganda:
            r = .UGX
        case .Ukraine:
            r = .UAH
        case .Algeria:
            r = .DZD
        case .Sudan:
            r = .SDG
        case .Iraq:
            r = .IQD
        case .Afghanistan:
            r = .AFN
        case .Poland:
            r = .PLN
        case .Canada:
            r = .CAD
        case .Morocco:
            r = .MAD
        case .SaudiArabia:
            r = .SAR
        case .Uzbekistan:
            r = .UZS
        case .Peru:
            r = .PEN
        case .Malaysia:
            r = .MYR
        case .Angola:
            r = .AOA
        case .Mozambique:
            r = .MZN
        case .Yemen:
            r = .YER
        case .Ghana:
            r = .GHS
        case .Nepal:
            r = .NPR
        case .Venezuela:
            r = .VEF
        case .Madagascar:
            r = .MGA
        case .Cameroon:
            r = .XAF
        case .IvoryCoast:
            r = .XOF
        case .NorthKorea:
            r = .KPW
        case .Australia:
            r = .AUD
        case .Taiwan:
            r = .TWD
        case .Niger:
            r = .XOF
        case .SriLanka:
            r = .LKR
        case .BurkinaFaso:
            r = .XOF
        case .Mali:
            r = .XOF
        case .Romania:
            r = .RON
        case .Chile:
            r = .CLP
        case .Malawi:
            r = .MWK
        case .Kazakhstan:
            r = .KZT
        case .Zambia:
            r = .ZMW
        case .Guatemala:
            r = .GTQ
        case .Ecuador:
            r = .USD
        case .Netherlands:
            r = .ANG
        case .Syria:
            r = .SYP
        case .Cambodia:
            r = .KHR
        case .Senegal:
            r = .XOF
        case .Chad:
            r = .XAF
        case .Somalia:
            r = .SOS
        case .Zimbabwe:
            r = .ZWL
        case .Guinea:
            r = .GNF
        case .Rwanda:
            r = .RWF
        case .Benin:
            r = .XOF
        case .Tunisia:
            r = .TND
        case .Belgium:
            r = .EUR
        case .Bolivia:
            r = .BOB
        case .Cuba:
            r = .CUP
        case .Haiti:
            r = .HTG
        case .SouthSudan:
            r = .SSP
        case .Burundi:
            r = .BIF
        case .DominicanRepublic:
            r = .DOP
        case .CzechRepublic:
            r = .CZK
        case .Greece:
            r = .EUR
        case .Portugal:
            r = .EUR
        case .Jordan:
            r = .JOD
        case .Azerbaijan:
            r = .AZN
        case .Sweden:
            r = .SEK
        case .UnitedArabEmirates:
            r = .AED
        case .Honduras:
            r = .HNL
        case .Hungary:
            r = .HUF
        case .Belarus:
            r = .BYR
        case .Tajikistan:
            r = .TJS
        case .Austria:
            r = .EUR
        case .PapuaNewGuinea:
            r = .PGK
        case .Serbia:
            r = .RSD
        case .Switzerland:
            r = .CHF
        case .Israel:
            r = .ILS
        case .Togo:
            r = .XOF
        case .SierraLeone:
            r = .SLL
        case .HongKong:
            r = .HKD
        case .Laos:
            r = .LAK
        case .Paraguay:
            r = .PYG
        case .Bulgaria:
            r = .BGN
        case .Lebanon:
            r = .LBP
        case .Libya:
            r = .LYD
        case .Nicaragua:
            r = .NIO
        case .ElSalvador:
            r = .USD
        case .Kyrgyzstan:
            r = .KGS
        case .Turkmenistan:
            r = .TMT
        case .Singapore:
            r = .SGD
        case .Denmark:
            r = .DKK
        case .Finland:
            r = .EUR
        case .Slovakia:
            r = .EUR
        case .Norway:
            r = .NOK
        case .CostaRica:
            r = .CRC
        case .Palestine:
            r = .ILS
        case .Oman:
            r = .OMR
        case .Liberia:
            r = .LRD
        case .Ireland:
            r = .EUR
        case .NewZealand:
            r = .NZD
        case .CentralAfricanRepublic:
            r = .XAF
        case .Mauritania:
            r = .MRO
        case .Panama:
            r = .PAB
        case .Kuwait:
            r = .KWD
        case .Croatia:
            r = .HRK
        case .Moldova:
            r = .MDL
        case .Georgia:
            r = .GEL
        case .Eritrea:
            r = .ERN
        case .Uruguay:
            r = .UYU
        case .BosniaAndHerzegovina:
            r = .BAM
        case .Mongolia:
            r = .MNT
        case .Armenia:
            r = .AMD
        case .Jamaica:
            r = .JMD
        case .PuertoRico:
            r = .USD
        case .Albania:
            r = .ALL
        case .Qatar:
            r = .QAR
        case .Lithuania:
            r = .EUR
        case .Namibia:
            r = .NAD
        case .Gambia:
            r = .GMD
        case .Botswana:
            r = .BWP
        case .Gabon:
            r = .XAF
        case .Lesotho:
            r = .LSL
        case .Slovenia:
            r = .EUR
        case .Latvia:
            r = .EUR
        case .Bahrain:
            r = .BHD
        case .Estonia:
            r = .EUR
        case .Mauritius:
            r = .MUR
        case .Cyprus:
            r = .EUR
        case .Djibouti:
            r = .DJF
        case .Fiji:
            r = .FJD
        case .Bhutan:
            r = .BTN
        case .Comoros:
            r = .KMF
        case .PalestinianTerritories:
            r = .ILS
        case .WesternSahara:
            r = .MAD
            
        case .Andorra:
            r = .EUR
        case .Aruba:
            r = .AWG
        //                case .Curaao:
        //                    r = .
        case .SintMaarten:
            r = .ANG
        case .Suriname:
            r = .SRD
        case .FaroeIslands:
            r = .FOK
        case .Liechtenstein:
            r = .CHF
        case .Iceland:
            r = .ISK
        case .SanMarino:
            r = .EUR
        case .Luxembourg:
            r = .EUR
        case .Brunei:
            r = .BND
        case .Malta:
            r = .EUR
        case .GuineaBissau:
            r = .XOF
        case .MacauSarChina:
            r = .MOP
        case .SoTomPrncipe:
            r = .STD
        case .TimorLeste:
            r = .USD
        case .BosniaHerzegovina:
            r = .BAM
        case .Montenegro:
            r = .EUR
        case .CanaryIslands:
            r = .EUR
        case .CeutaMelilla:
            r = .EUR
        case .EquatorialGuinea:
            r = .XAF
        case .Tonga:
            r = .TOP
        case .Kosovo:
            r = .EUR
        case .Macedonia:
            r = .MKD
        case .Greenland:
            r = .DKK
        case .CapeVerde:
            r = .CVE
        case .IsleOfMan:
            r = .IMP
        case .LatinLiberia:
            r = .LRD
        case .Abkhazia:
            r = .ABK
        case .Curacao:
            r = .ANG
        }
        return r
    }
}

