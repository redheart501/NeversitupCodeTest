//
//  HomeProtocols.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/19/22.
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func showCurrencyList(_ data : currencyListModel)
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    func getCurrentPriceList()
}

protocol HomeRouterProtocol: AnyObject {
    static func createModule() -> UIViewController?
}

protocol HomeInteractorInputProtocol {
    var presenter: HomeInteractorOutputProtocol? { get set }
    var webService: HomeWebServiceInputProtocol? { get set }
    func callCurrentPriceListApi()
    
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func success(_ data : currencyListModel)
    func fail()
}

protocol HomeWebServiceInputProtocol {
    var interactor: HomeWebServiceOutputProtocol? { get set }
    func callCurrencyList()
    
}
protocol HomeWebServiceOutputProtocol {
    func responseFromCurrencyList(_ isSuccess : Bool? , data : currencyListModel)
}
