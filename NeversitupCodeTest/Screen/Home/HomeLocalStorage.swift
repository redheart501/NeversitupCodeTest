//
//  HomeLocalStorage.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/19/22.
//

import Foundation


class HomeLocalStorage : HomeLocalStorageProtocol{
  
    func saveCurrencyData(_ data: currencyListModel) {
        var currencyData = [currencyModel]()
        for i in (data.bpi?.values)!{
            let data = i as! [String : Any]
            print(data)
            currencyData.append(currencyModel(JSON: data)!)
        }
        LocalStorageManager.shared.saveData(data: currencyData, updatedISO: data.updatedISO ?? "")
    }
    
    
}
