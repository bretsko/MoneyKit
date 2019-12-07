

@_exported import MinimalBase

public protocol HasCurrencyData {
    
    var currencyData: CurrencyP { get }
}

public extension HasCurrencyData {
    
    /// The currency code
    var currencyCode: String {
        return currencyData.code
    }
    
    /// The currency scale
    var currencyScale: Int {
        return currencyData.scale
    }
    
    /// The currency symbol
    var currencySymbol: String {
        return currencyData.symbol
    }
    
    /// full currency name
    var currencyName: String? {
        return currencyData.name
    }
}
