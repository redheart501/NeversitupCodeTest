//
//  HistoryViewPresenter.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/20/22.
//

import Foundation
import UIKit


class HistoryViewPresenter : HistoryPresenterProtocol{
  
    
    var view: HistoryViewProtocol?
    
    var interactor: HistoryInteractorInputProtocol?
    
    var router: HistoryRouterProtocol?
    
    func getHistoryList() {
        interactor?.getHistoryListFromDataBase()
    }
    func deleteDatabase() {
        interactor?.deleteDatabase()
    }
    
}
extension HistoryViewPresenter : HistoryInteractorOutputProtocol {
    func successDelete() {
        view?.showDeletingAlert()
    }
    
    
    func success(_ data: [HistoryRateObject]) {
        view?.showHistoryList(data)
    }
    
    
    func fail() {
        
    }
    
    
}
