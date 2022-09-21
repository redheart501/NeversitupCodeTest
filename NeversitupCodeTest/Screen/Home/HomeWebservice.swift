//
//  HomeWebservice.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/19/22.
//

import Foundation
import UIKit
import Alamofire
import ObjectMapper

class HomeWebService : HomeWebServiceInputProtocol{
    var interactor: HomeWebServiceOutputProtocol?
    
    func callCurrencyList(){
        let req = AF.request(Constants.currencyList_url, method: .get,encoding: JSONEncoding.default).responseJSON { (responce) in
            switch responce.result {
            case .success(let value):
                guard let userData = Mapper<currencyListModel>().map(JSON: value as! [String : Any]) else { return }
            
                self.interactor?.responseFromCurrencyList(true, data: userData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
