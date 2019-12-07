//
//@_exported import LocalBase
//
//
//public extension MoneyFormatter {
//    
//    //MARK: - generate
//    
//    /// - parameter unitStyle: There are 3 widths: long, medium, and short. For example, for English, when formatting "3 pounds" Long is "3 pounds"; medium is "3 lb"; short is "3#"
//    /// - parameter unitOptions: If not specified, unitOptions defaults to localizing according to the preferences of the locale.
//    ///
//    /// By default, if unitOptions is set to the empty set, the formatter will do the following:
//    /// - kilocalories may be formatted as "C" instead of "kcal" depending on the locale.
//    /// - kilometersPerHour may be formatted as "miles per hour" for US and UK locales but "kilometers per hour" for other locales.
//    ///
//    /// However, if providedUnit is set, the formatter will do the following:
//    /// - kilocalories would be formatted as "kcal" in the language of the locale, even if the locale prefers "C".
//    /// - kilometersPerHour would be formatted as "kilometers per hour" for US and UK locales even though the preference is for "miles per hour."
//    ///
//    /// Note that formatter will handle converting measurement objects to the preferred units in a particular locale.  For instance, if provided a measurement object in kilometers and the set locale is en_US, the formatter will implicitly convert the measurement object to miles and return the formatted string as the equivalent measurement in miles.
//    static func generate(min: Double = 1,
//                         max: Double = 1000,
//                         step: Double = 1,
//                         
//                         possibleUnits: Set<MeasureUnit> = MeasureUnit.allForms,
//                         _ possibleFormats: Set<MeasureFormat> = MeasureFormat.allForms)  -> Set<Self> {
//        
//        Double.generate(min: min, max: max, step: step).map { value in
//            
//            possibleUnits.map { unit in
//                possibleFormats.map { format in
//                    Self(unit, value, format)
//                }
//            }.flatMap{$0}
//        }.flatMap{$0}.set
//    }
//    
//    static func generate(min: Double = 1,
//                         max: Double = 1000,
//                         step: Double = 1,
//                         possibleUnits: Set<MeasureUnit> = MeasureUnit.allForms,
//                         _ format: MeasureFormat) -> Set<Self> {
//        generate(min: min,max: max,step: step,
//                 possibleUnits: possibleUnits,
//                 Set([format]))
//    }
//    
//    static func generate(min: Double = 1,
//                         max: Double = 1000,
//                         step: Double = 1,
//                         _ unit: MeasureUnit,
//                         _ format: MeasureFormat) -> Set<Self> {
//        generate(min: min,max: max,step: step,
//                 possibleUnits: Set([unit]),
//                 Set([format]))
//    }
//    
//    //TODO: conv ?
//    //    static func generate(min: Double = 1,
//    //                         max: Double = 1000,
//    //                         step: Double = 1,
//    //                         unitStyles: Set<MeasUnitStyle> = Set(),
//    //                                 unitOptions: Set<MeasFormatterOptions> = Set(),
//    //                                 _ locales: Set<LID> = Set()) -> Set<Self> {
//    //
//    //        let options: Set<MeasureFormat> = {
//    //
//    //            //TODO: if any is empty - will return nil
//    //            unitStyles.map { unitStyle in
//    //                unitOptions.map { unitOption in
//    //                    locales.map { locale in
//    //                        MeasureFormat(unitStyle: unitStyle,
//    //                                         unitOptions: unitOption,
//    //                                         locale)
//    //                    }
//    //                }.flatMap{$0}
//    //            }.flatMap{$0}.set
//    //        }
//    //        return generate(min: min, max: max, step: step, options)
//    //    }
//    
//    /// Returns a set of Doubles in the range from 1 to 1 thousand, 0 is not included, not all possible measures !
//    static var allForms: Set<Self> {
//        generate()
//    }
//}
