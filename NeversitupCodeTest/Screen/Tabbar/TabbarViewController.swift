//
//  TabbarViewController.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/19/22.
//

import Foundation
import UIKit

class TabbarViewController : UITabBarController{
    
    override func viewDidLoad() {
        if let homeView = HomeRouter.createModule() {
            viewControllers?[0] = homeView
        }
        if let historyView = HistoryRouter.createModule() {
            viewControllers?[2] = historyView
        }
    }
    
}
