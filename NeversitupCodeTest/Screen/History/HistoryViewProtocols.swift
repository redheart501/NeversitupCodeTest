//
//  HistoryViewProtocols.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/20/22.
//

import Foundation
import UIKit

protocol HistoryViewProtocol: AnyObject {
    var presenter: HistoryPresenterProtocol? { get set }
    func showHistoryList(_ data : [HistoryRateObject])
    func showDeletingAlert()
}

protocol HistoryPresenterProtocol: AnyObject {
    var view: HistoryViewProtocol? { get set }
    var interactor: HistoryInteractorInputProtocol? { get set }
    var router: HistoryRouterProtocol? { get set }
    func getHistoryList()
    func deleteDatabase()
}

protocol HistoryInteractorInputProtocol {
    var presenter: HistoryInteractorOutputProtocol? { get set }
    var localStorage: HistoryLocalStorageProtocol? { get set }
    
    func getHistoryListFromDataBase()
    func deleteDatabase()
    
}

protocol HistoryInteractorOutputProtocol: AnyObject {
    func success(_ data : [HistoryRateObject])
    func successDelete()
    func fail()
}


protocol HistoryLocalStorageProtocol{
    var dataOutput : HistoryLocalStorageOutputProtocol?{get set}
    func getCurrencyData()
    func deleteDatabase()
}
protocol HistoryLocalStorageOutputProtocol{
    func responseDataFromDatabase(_ data : [HistoryRateObject])
    func responseDeleting()
}
protocol HistoryRouterProtocol: AnyObject {
    static func createModule() -> UIViewController?
}
