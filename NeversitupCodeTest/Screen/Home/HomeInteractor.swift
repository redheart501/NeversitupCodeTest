//
//  HomeInteractor.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/19/22.
//

import Foundation
import UIKit

class HomeViewInteractor: HomeInteractorInputProtocol {
    var presenter: HomeInteractorOutputProtocol?
    var localStorage : HomeLocalStorageProtocol?
    var webService: HomeWebServiceInputProtocol?
    
    func callCurrentPriceListApi() {
        webService?.callCurrencyList()
    }
    
    
}

extension HomeViewInteractor : HomeWebServiceOutputProtocol{
    func responseFromCurrencyList(_ isSuccess: Bool?,data : currencyListModel) {
        if isSuccess! {
            presenter?.success(data)
            localStorage?.saveCurrencyData(data)
        }else{
            presenter?.fail()
        }
    }
    
    
    
}
