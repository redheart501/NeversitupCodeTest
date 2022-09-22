//
//  HomePresenter.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/19/22.
//

import Foundation
import UIKit

class HomePresenter : HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
    var interactor: HomeInteractorInputProtocol?
    
    func getCurrentPriceList() {
        interactor?.callCurrentPriceListApi()
    }
    func presentToCovertView() {
        router?.presentToCovertView(view)
    }
    
}
extension HomePresenter:  HomeInteractorOutputProtocol{
    func success(_ data : currencyListModel) {
        view?.showCurrencyList(data)
    }
    
    func fail() {
       
    }
    
    
}
