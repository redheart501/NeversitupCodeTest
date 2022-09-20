//
//  LocalStorageManager.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/20/22.
//

import Foundation
import RealmSwift


class HistoryRateObject: Object {
    @Persisted var updatedISO: String = ""
    @Persisted var USD_Price: Float = 0.0
    @Persisted var EUR_Price: Float = 0.0
    @Persisted var GBP_Price: Float = 0.0
}

class LocalStorageManager {
    
    static let shared = LocalStorageManager()
    private init() {}
    
    private let realm = try! Realm()
    
    func saveData(data: [currencyModel], updatedISO: String) {
        
        try! realm.write{
            
            let historyRate = HistoryRateObject()
          
            for i in data {
                switch Utility().getCurrenyType(i.code ?? "USD") {
                case .USD:
                    historyRate.USD_Price = i.rate_float ?? 0.0
                case .EUR:
                    historyRate.EUR_Price = i.rate_float ?? 0.0
                case .GBP:
                    historyRate.GBP_Price = i.rate_float ?? 0.0
                default: break
                }
            }
            historyRate.updatedISO = updatedISO
            realm.add(historyRate)
        }
    }
    
    func getData() -> [HistoryRateObject] {
        let result = realm.objects(HistoryRateObject.self)
        return Array(result)
    }
   
    func deleteHistory(){
        let realm = try! Realm()
        try! realm.write {
          realm.deleteAll()
        }
    }
}
