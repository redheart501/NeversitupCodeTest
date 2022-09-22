//
//  HomeRouter.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/19/22.
//

import Foundation
import UIKit


class HomeRouter : HomeRouterProtocol {
    static func createModule() -> UIViewController? {
        guard let view = UIViewController.HomeViewController as? HomeViewController else { return nil }
        let router: HomeRouterProtocol = HomeRouter()
        var presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        var interactor: HomeInteractorInputProtocol & HomeWebServiceOutputProtocol = HomeViewInteractor()
        var webService: HomeWebServiceInputProtocol = HomeWebService()
        let localStorage: HomeLocalStorageProtocol = HomeLocalStorage()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.webService = webService
        interactor.localStorage = localStorage
        webService.interactor = interactor
        return view
    }
    
    func presentToCovertView(_ view: HomeViewProtocol?) {
        guard let view = view as? UIViewController else { return }
        if let vc = ConvertViewRouter.createModule(isFromHome: true){
            view.present(vc, animated: true)
        }
       
    }
}
