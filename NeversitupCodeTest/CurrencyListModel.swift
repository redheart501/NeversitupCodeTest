//
//  CurrencyListModel.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/19/22.
//

import Foundation
import ObjectMapper

class currencyListModel: Mappable {
    
    var bpi : Dictionary<String, Any>?
    var USD : currencyModel?
    var GBP : currencyModel?
    var EUR : currencyModel?

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        bpi <- map["bpi"]
        USD <- map["bpi.USD"]
        GBP <- map["bpi.GBP"]
        EUR <- map["bpi.EUR"]
    }
    

}
class currencyModel : Mappable{
    var code: String?
    var symbol: String?
    var rate: String?
    var description: String?
    var rate_float: Float?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        code <- map["code"]
        symbol <- map["symbol"]
        rate <- map["rate"]
        description <- map["description"]
        rate_float <- map["rate_float"]
    }
}

struct CurrentPriceModel: Codable {
    let bpi: [ String : CurrencyModel]
}
struct CurrencyModel: Codable {
    let code: String
    let symbol: String
    let rate: String
    let description: String
    let rate_float: Float?
    
}
