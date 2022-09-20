//
//  HistoryViewInteractor.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/20/22.
//

import Foundation

class HistoryViewInteractor : HistoryInteractorInputProtocol{
   
    var presenter: HistoryInteractorOutputProtocol?
    
    var localStorage: HistoryLocalStorageProtocol?
    
    func getHistoryListFromDataBase() {
        localStorage?.getCurrencyData()
    }
    
    func deleteDatabase() {
        localStorage?.deleteDatabase()
    }
    
}

extension HistoryViewInteractor  : HistoryLocalStorageOutputProtocol{
    func responseDeleting() {
        presenter?.successDelete()
    }
    
    func responseDataFromDatabase(_ data: [HistoryRateObject]) {
        presenter?.success(data)
    }
    
    
    
    
}
