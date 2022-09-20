//
//  HistoryRouter.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/20/22.
//

import Foundation
import UIKit

class HistoryRouter : HistoryRouterProtocol{
    static func createModule() -> UIViewController? {
        guard let view = UIViewController.HistoryViewController as? HistoryViewController else { return nil }
        let router: HistoryRouterProtocol = HistoryRouter()
        var presenter: HistoryPresenterProtocol & HistoryInteractorOutputProtocol = HistoryViewPresenter()
        var interactor: HistoryInteractorInputProtocol   & HistoryLocalStorageOutputProtocol = HistoryViewInteractor()
        var localStorage: HistoryLocalStorageProtocol = HistoryViewLocalstorage()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localStorage = localStorage
        localStorage.dataOutput = interactor
        return view
    }
    
    
}
