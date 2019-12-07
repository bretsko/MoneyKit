
import MinimalBase

/// based on https://www.worlddata.info/currencies/
public enum Currency: String, StrEnumT, CurrencyP {
    
    /// UAE Dirham
    /// 1 AED = 100 Fils
    /// United Arab Emirates
    case AED

    /// Afghani
    /// 1 AFN = 100 Puls
    /// Afghanistan
    case AFN

    /// Lek
    /// 1 ALL = 100 Qindarka
    /// Albania
    case ALL
   

    /// Dram
    /// 1 AMD = 100 Lumma
    /// Armenia
    case AMD
   

    /// Netherlands Antillean Guilder
    /// 1 ANG = 100 Cents
    /// Sint Maarten, Curacao
    case ANG
    
 
    /// Kwanza
    /// 1 AOA = 100 Lwei
    /// Angola
    case AOA
    

    /// Argentine Peso
    /// 1 ARS = 100 Centavos
    /// Argentina
    case ARS
    

    /// Australian Dollar
    /// 1 AUD = 100 Cents
    /// Australia, Christmas Island, Cocos Islands, Nauru, Norfolk Island, Heard Island and McDonald Islands
    case AUD
    
 
    /// Florin
    /// 1 AWG = 100 Cents
    /// Aruba
    case AWG
    
    /// Manat
    ///  1 AZN = 100 Qäpi
    /// Azerbaijan
    case AZN
   
    /// Convertible Mark
    /// 1 BAM = 100 Fening
    /// Bosnia and Herzegovina
    case BAM
    

    /// Barbadian Dollar
    /// 1 BBD = 100 Cents
    /// Barbados
    case BBD
    

    /// Taka
    /// 1 BDT = 100 Poisha
    /// Bangladesh
    case BDT

    /// Bulgarian Lev
    ///  1 BGN = 100 Stotinki
    /// Bulgaria
    case BGN
   
    /// Bahrain Dinar
    /// 1 BHD = 1000 Fils
    /// Bahrain
    case BHD
    

    /// Burundi Franc
    /// 1 BIF = 100 Centimes
    /// Burundi
    case BIF
    
    
    /// Bermudian Dollar
    /// 1 BMD = 100 Cent
    /// Bermuda
    case BMD
        
    /// Brunei Dollar
    /// 1 BND = 100 Cents
    /// Brunei
    case BND
        
    /// Boliviano
    /// 1 BOB = 100 Centavos
    /// Bolivia
    case BOB
    
    /// Real
    /// 1 BRL = 100 Centavos
    /// Brazil
    case BRL
    
    /// Bahamian Dollar
    /// 1 BSD = 100 Cents
    /// Bahamas
    case BSD
       
    /// Ngultrum
    /// 1 BTN = 100 Chetrum
    /// Bhutan
    case BTN
        
    /// Pula
    /// 1 BWP = 100 Thebe
    /// Botswana
    case BWP
    
    
    /// Belarus Rubel
    /// 1 BYR = 100 Kapejek
    /// Belarus
    case BYR
     
    
    /// Belize Dollar
    /// 1 BZD = 100 Cents
    /// Belize
    case BZD
       
    /// Canadian Dollar
    /// 1 CAD = 100 Cents
    /// Canada
    case CAD
    
    /// Congolais Franc
    /// 1 CDF = 100 Centimes
    /// Republic of the Congo, Democratic Republic of the Congo
    case CDF
    
    
    /// Swiss Franc
    /// 1 CHF = 100 Rappen
    /// Liechtenstein, Switzerland
    case CHF
        
    
    /// Cook Dollar
    /// 1 CKD = 100 Cents
    /// Cook Islands
    case CKD
    
    /// Chilean Peso
    /// 1 CLP = 100 Centavos
    /// Chile
    case CLP
    
    
    /// Renminbi Yuan
    ///  1 CNY = 100 Fen
    /// China
    case CNY
   
    
    /// Colombian Peso
    /// 1 COP = 100 Centavos
    /// Colombia
    case COP
     
    
    /// Colón
    /// 1 CRC = 100 Céntimos
    /// Costa Rica
    case CRC
    
    
    /// Cuban Peso
    /// 1 CUP = 100 Centavos
    /// Cuba
    case CUP
   
    
    /// Cape Verdean Escudo
    /// 1 CVE = 100 Centavos
    /// Cape Verde
    case CVE
        
    /// Czech Krone
    /// 1 CZK = 100 Haleru
    /// Czechia
    case CZK
    
    
    /// Djibouti Franc
    /// 1 DJF = 100 Centimes
    /// Djibouti
    case DJF
        
    /// Danish Krone
    /// 1 DKK = 100 øre
    /// Denmark
    case DKK
   
    
    /// Dominican Peso
    /// 1 DOP = 100 Centavos
    /// Dominican Republic
    case DOP
    
    
    /// Algerian Dinar
    /// 1 DZD = 100 Centimes
    /// Algeria
    case DZD
    
    /// Egypt Pound
    /// 1 EGP = 100 Piasters
    /// Egypt
    case EGP
    
    /// Nakfa
    /// 1 ERN = 100 Cents
    /// Eritrea
    case ERN
        
    /// Birr
    /// 1 ETB = 100 Cents
    /// Ethiopia
    case ETB
    
    
    /// Euro
    /// 1 EUR = 100 Cent
    /// Netherlands, Andorra, Belgium, Spain, Guadeloupe, Ireland, Italy, Austria, Greece, Cyprus, Latvia, Lithuania, Luxembourg, Malta, Martinique, Mayotte, Monaco, Portugal, France, French Guiana, Reunion, Saint Pierre and Miquelon, Germany, San Marino, Slovakia, Slovenia, Finland, Holy See (Vatican City), Estonia, French Southern and Antarctic Lands, Montenegro, Saint Barthelemy, Kosovo, Åland Islands, Saint Martin
    case EUR
        
    
    /// Fidschi Dollar
    /// 1 FJD = 100 Cent
    /// Fiji
    case FJD
    
    
    /// Falklands Pound
    /// 1 FKP = 100 Pence
    /// Falkland Islands
    case FKP
    
    /// Faroese Krona
    /// 1 FOK = 100 Oyra
    /// Faroe Islands
    case FOK
        
    /// Sterling Pound
    /// 1 GBP = 100 Pence
    /// United Kingdom, Pitcairn Islands, South Georgia and South Sandwich Islands
    case GBP
        
    
    /// Georgian Lari
    /// 1 GEL = 100 Tetri
    /// Georgia
    case GEL
    
    /// Guernsey Pound
    /// 1 GGP = 100 Pence
    /// Guernsey
    case GGP
        
    /// Ghana Cedi
    /// 1 GHS = 100 Pesewas
    /// Ghana
    case GHS
    
    /// Gibraltar Pound
    /// 1 GIP = 100 Pence
    /// Gibraltar
    case GIP
        
    /// Dalasi
    /// 1 GMD = 100 Bututs
    /// Gambia
    case GMD
        
    
    /// Guinea Franc
    /// 1 GNF = 100 Centimes
    /// Guinea
    case GNF
        
    
    /// Quetzal
    /// 1 GTQ = 100 Centavos
    /// Guatemala
    case GTQ
    
    
    /// Guyana Dollar
    /// 1 GYD = 100 Cents
    /// Guyana
    case GYD     
    
    
    /// Hong Kong Dollar
    /// 1 HKD = 100 Cents
    /// Hong Kong
    case HKD
        
    /// Lempira
    /// 1 HNL = 100 Centavos
    /// Honduras
    case HNL
    
    
    /// Kuna
    /// 1 HRK = 100 Lipa
    /// Croatia
    case HRK
    
    
    /// Gourde
    /// 1 HTG = 100 Centimes
    /// Haiti
    case HTG
    
    
    /// Hungarian Forint
    /// 1 HUF = 100 Fillér
    /// Hungary
    case HUF
    
    
    /// Idonesian Rupiah
    /// 1 IDR = 100 Sen
    /// Indonesia
    case IDR
    
    
    /// Shekel
    /// 1 ILS = 100 Agorot
    /// Israel, Palestine
    case ILS
        
    
    /// Manx Pound
    /// 1 IMP = 100 Pence
    /// Isle of Man
    case IMP
        
    /// Indian Rupee
    /// 1 INR = 100 Paise
    /// India
    case INR
        
    
    /// Iraqi Dinar
    /// 1 IQD = 1000 Fils
    /// Iraq
    case IQD
     
    
    /// Iranian Rial
    /// 1 IRR = 100 Dinars
    /// Iran
    case IRR
    
    
    /// Icelandic Krone
    /// 1 ISK = 100 Aurar
    /// Iceland
    case ISK
    
    
    /// Jersey Sterling Pound
    /// 1 JEP = 100 Penny
    /// Jersey
    case JEP
        
    /// Jamaica Dollar
    /// 1 JMD = 100 Cents
    /// Jamaica
    case JMD
    
    
    /// Jordanian Dinar
    /// 1 JOD = 100 Piaster
    /// Jordan
    case JOD
        
    /// Japanese Yen
    /// 1 JPY = 100 Sen
    /// Japan
    case JPY
    
    
    /// Kenian Schilling
    /// 1 KES = 100 Cents
    /// Kenya
    case KES
    
    
    /// Som
    /// 1 KGS = 100 Tyiyn
    /// Kyrgyzstan
    case KGS
    
    
    /// Riel
    /// 1 KHR = 10 Karak = 100 Sen
    /// Cambodia
    case KHR

    
    /// Kiribati Dollar
    /// 1 KID = 100 Cents
    /// Kiribati
    case KID
        
    /// Comorian Franc
    /// 1 KMF = 100 Centimes
    /// Comoros
    case KMF
        
    /// Won
    /// 1 KPW = 100 Chon
    /// North Korea
    case KPW
        
    
    /// Won
    /// 1 KRW = 100 Chon
    /// South Korea
    case KRW
    
    
    /// Kuwaiti Dinar
    /// 1 KWD = 1000 Fils
    /// Kuwait
    case KWD
        
    /// Cayman Dollar
    /// 1 KYD = 100 Cent
    /// Cayman Islands
    case KYD
        
    /// Tenge
    /// 1 KZT = 100 Tyin
    /// Kazakhstan
    case KZT
    
    
    /// Kip
    /// 1 LAK = 100 At
    /// Laos
    case LAK
    
    
    /// Lebanese Pound
    /// 1 LBP = 100 Piastres
    /// Lebanon
    case LBP
        
    /// Sri Lanka Rupee
    /// 1 LKR = 100 Cents
    /// Sri Lanka
    case LKR
    
    
    /// Liberian Dollar
    /// 1 LRD = 100 Cents
    /// Liberia
    case LRD
   
    
    /// Lesotho Loti
    /// 1 LSL = 100 Lisente
    /// Lesotho
    case LSL
        
    /// Libyan Dinar
    /// 1 LYD = 1000 Dirhams
    /// Libya
    case LYD
    
    
    /// Moroccan Dirham
    /// 1 MAD = 100 Centimes
    /// Western Sahara, Morocco
    case MAD
    
    
    /// Leu
    /// 1 MDL = 100 Bani
    /// Moldova
    case MDL
    
    
    /// Malagasy Ariary
    /// Madagascar
    /// 1 MGA = 5 Iraimbilanja
    case MGA
    
    
    /// Denar
    /// 1 MKD = 100 Deni
    /// North Macedonia
    case MKD
    
    
    /// Kyat
    /// 1 MMK = 100 Pyas
    /// Burma
    case MMK
    
    
    /// Tugrik
    /// 1 MNT = 100 Möngö
    /// Mongolia
    case MNT
    
    
    /// Macanese Pataca
    /// 1 MOP = 100 Avos
    /// Macao
    case MOP
        
    /// Ouguiya
    /// 1 MRO = 5 Khoums
    /// Mauritania
    case MRO
    
    
    /// Mauritian Rupee
    /// 1 MUR = 100 Cents
    /// Mauritius
    case MUR
    
    
    /// Maldivian Rufiyaa
    /// 1 MVR = 100 Laari
    /// Maldives
    case MVR
    
    
    /// Kwacha
    /// 1 MWK = 100 Tambala
    /// Malawi
    case MWK
    
    
    /// Mexican Peso
    /// 1 MXN = 100 Centavos
    /// Mexico
    case MXN
   
    
    /// Ringgit
    /// 1 MYR = 100 Sen
    /// Malaysia
    case MYR
    
    
    /// Metical
    /// 1 MZN = 100 Centavos
    /// Mozambique
    case MZN
    
    
    /// Namibian Dollar
    /// 1 NAD = 100 Cents
    /// Namibia
    case NAD
        
    /// Naira
    /// 1 NGN = 100 Kobo
    /// Nigeria
    case NGN
    
    
    /// Córdoba Oro
    /// 1 NIO = 100 Centavos
    /// Nicaragua
    case NIO
    
    
    /// Norwegian Krone
    /// 1 NOK = 100 Øre
    /// Svalbard, Norway, Bouvet Island
    case NOK
    
    
    /// Nepalese Rupee
    /// 1 NPR = 2 Mohur = 100 Paisa
    /// Nepal
    case NPR
        
    /// New Zealand Dollar
    /// 1 NZD = 100 Cents
    /// Niue, Tokelau, New Zealand
    case NZD
    
    
    /// Omani Rial
    /// 1 OMR = 1000 Baizas
    /// Oman
    case OMR
    
    
    /// Panamanian Balboa
    /// 1 PAB = 100 Centesimos
    /// Panama
    case PAB
        
    /// Nuevo Sol
    /// 1 PEN = 100 Céntimos
    /// Peru
    case PEN
    
    
    /// Kina
    /// 1 PGK = 100 Toea
    /// Papua New Guinea
    case PGK
    
    
    /// Philippine Peso
    /// 1 PHP = 100 Centavos
    /// Philippines
    case PHP
    
    
    /// Pakistanian Rupee
    /// 1 PKR = 100 Paisa
    /// Pakistan
    case PKR
    
    
    /// Zloty
    /// 1 PLN = 100 Groszy
    /// Poland
    case PLN
    
    
    /// Guaraní
    /// 1 PYG = 100 Centimos
    /// Paraguay
    case PYG
    
    
    /// Qatari Rial
    /// 1 QAR = 100 Dirham
    /// Qatar
    case QAR
        
    /// Leu
    /// 1 RON = 100 Bani
    /// Romania
    case RON
    
    
    /// Serbian Dinar
    /// 1 RSD = 100 Para
    /// Serbia
    case RSD
    
    
    /// Russian Rubel
    /// 1 RUB = 100 Kopeken
    /// Russia
    case RUB
    
    
    /// Rwandan Franc
    /// 1 RWF = 100 Centimes
    /// Rwanda
    case RWF
    
    
    /// Saudi Rial
    /// 1 SAR = 20 Qirshes = 100 Hallalas
    /// Saudi Arabia
    case SAR
    
    
    /// Salomon Dollar
    /// 1 SBD = 100 Cents
    /// Solomon Islands
    case SBD
    
    
    /// Seychelles Rupee
    /// 1 SCR = 100 Cents
    /// Seychelles
    case SCR
    
    
    /// Sudanese Pound
    /// 1 SDG = 100 Piaster
    /// Sudan
    case SDG
    
    
    /// Swedish Krone
    /// 1 SEK = 100 Öre
    /// Sweden
    case SEK
    
    
    /// Singapore Dollar
    /// 1 SGD = 100 Cents
    /// Singapore
    case SGD
    
    
    /// St.-Helena Pound
    /// 1 SHP = 100 Pence
    /// Saint Helena, Ascension and Tristan da Cunha
    case SHP
        
    /// Leone
    /// 1 SLL = 100 Cents
    /// Sierra Leone
    case SLL
    
    
    /// Somalian Shilling
    /// 1 SOS = 100 Centesimi
    /// Somalia
    case SOS
    
    
    /// Surinam Dollar
    /// 1 SRD = 100 Cents
    /// Suriname
    case SRD
    
    
    /// South Sudanese Pound
    /// 1 SSP = 100 Piaster
    /// South Sudan
    case SSP
    
    /// Dobra
    /// 1 STD = 100 Centimes
    /// Sao Tome and Principe
    case STD
    
    
    /// Syrian Pound
    /// 1 SYP = 100 Piastres
    /// Syria
    case SYP
    
    
    /// Swazi Lilangeni
    /// 1 SZL = 100 Cents
    /// Swaziland
    case SZL
        
    /// Thai Baht
    /// 1 THB = 100 Satang
    /// Thailand
    case THB
   
    
    /// Somoni
    /// 1 TJS = 100 Dirham
    /// Tajikistan
    case TJS
    
    
    /// Manat
    /// 1 TMT = 100 Tenge
    /// Turkmenistan
    case TMT
    
    
    /// Tunesian Dinar
    /// 1 TND = 1000 Millimes
    /// Tunisia
    case TND
    
    
    /// Pa'anga
    /// 1 TOP = 100 Seniti
    /// Tonga
    case TOP
   
    
    /// Turkish Lira
    /// 1 TRY = 100 Kurus
    /// Turkey
    case TRY
   
    
    /// Trinidad and Tobago Dollar
    /// 1 TTD = 100 Cents
    /// Trinidad and Tobago
    case TTD
        
    
    /// Tuvaluan Dollar
    /// 1 TVD = 100 Cents
    ///Tuvalu
    case TVD
        
    /// New Taiwan Dollar
    /// 1 TWD = 100 Cents
    /// Taiwan
    case TWD
    
    
    /// Tansanian Shilling
    /// 1 TZS = 100 Cents
    /// Tanzania
    case TZS
    
    
    /// Hrywnja
    /// 1 UAH = 100 Kopeken
    /// Ukraine
    case UAH
        
    
    /// Ugandan Schilling
    /// 1 UGX = 100 Cents
    /// Uganda
    case UGX
    
    
    /// US Dollar
    /// 1 USD = 100 Cents
    /// American Samoa, British Virgin Islands, Ecuador, El Salvador, Guam, East Timor, Marshall Islands, Federated States of Micronesia, Palau, Northern Mariana Islands, Puerto Rico, Turks and Caicos Islands, United States, Virgin Islands, British Indian Ocean Territory, Bonaire, Saint Eustatius and Saba
    case USD
    
    
    /// Uruguay Peso
    /// 1 UYU = 100 Centesimos
    /// Uruguay
    case UYU
        
    
    /// Uzbekistan Sum
    /// 1 UZS = 100 Tiyin
    /// Uzbekistan
    case UZS
   
    
    /// Bolívar fuerte
    /// 1 VEF = 100 Céntimos
    /// Venezuela
    case VEF
        
    /// Dong
    /// 1 VND = 10 Hào = 100 Xu
    /// Vietnam
    case VND
    
    
    /// Vatu
    /// 1 VUV = 100 Centimes
    /// Vanuatu
    case VUV
   
    
    /// Tala
    /// 1 WST = 100 Sene
    /// Samoa
    case WST
   
    
    /// Central African Franc
    /// minor unit: absent
    /// Gabon, Cameroon, Central African Republic, Equatorial Guinea, Chad
    case XAF
    
    /// East Caribbean Dollar
    /// 1 XCD = 100 Cents
    /// Anguilla, Antigua and Barbuda, Dominica, Grenada, Montserrat, Saint Kitts and Nevis, Saint Lucia, Saint Vincent and the Grenadines
    case XCD
        
    /// West African Franc
    /// minor unit: absent
    /// Benin, Burkina Faso, Guinea-Bissau, Mali, Niger, Ivory Coast, Senegal, Togo
    case XOF
    
    /// Pacific Franc
    /// minor unit: absent
    /// French Polynesia, New Caledonia, Wallis and Futuna
    case XPF
    
    /// Jemen Rial
    /// 1 YER = 100 Fils
    /// Yemen
    case YER
    
    /// South African Rand
    /// 1 ZAR = 100 Cents
    /// South Africa
    case ZAR
        
    
    /// Zambian Kwacha
    /// 1 ZMW = 100 Ngwee
    /// Zambia
    case ZMW
    
    
    /// Zimbabwe Dollar
    /// 1 ZWL = 100 Cents
    /// Zimbabwe
    case ZWL
}

