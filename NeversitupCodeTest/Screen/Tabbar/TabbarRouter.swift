//
//  TabbarRouter.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/19/22.
//

import Foundation
import UIKit

class TabbarRouter : TabBarRouterProtocol {
    static func createModule() -> UIViewController? {
        guard let Vc = UIViewController.tabBarViewController as? TabbarViewController else { return nil }
        let router: TabBarRouterProtocol = TabbarRouter()
        let presenter: TabBarPresenterProtocol  = TabBarPresenter()
        presenter.router = router
        return Vc
    }
    
    
}
