//
//  HistoryViewLocalstorage.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/20/22.
//

import Foundation
import UIKit

class HistoryViewLocalstorage : HistoryLocalStorageProtocol{
    
    var dataOutput: HistoryLocalStorageOutputProtocol?
    
    
    func getCurrencyData() {
        dataOutput?.responseDataFromDatabase( LocalStorageManager.shared.getData())
       
    }
    func deleteDatabase() {
        LocalStorageManager.shared.deleteHistory()
        dataOutput?.responseDeleting()
    }
    
    
}
