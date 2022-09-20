//
//  Utility.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/20/22.
//

import Foundation
import UIKit

enum CurrencyType {
    case USD
    case EUR
    case GBP
}

class Utility {
    
    
    func getCurrenyType(_ name: String) -> CurrencyType {
        switch name {
        case "USD":
            return .USD
        case "EUR":
            return .EUR
        case "GBP":
            return .GBP

        default:
            return .USD
        }
    }
    
    func getCurrencySign(_ type: CurrencyType) -> String {
        switch type {
        case .USD:
            return "$"
        case .EUR:
            return "€"
        case .GBP:
            return "£"
        }
    }
    
    func flag(_ type: CurrencyType) -> String {
        var country = ""
        switch type {
        case .USD:
            country = "US"
        case .EUR:
            country = "EU"
        case .GBP:
            country = "GB"
        }
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
}
