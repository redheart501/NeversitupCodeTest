//
//  Uiviewcontroller+Extensions.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/19/22.
//

import Foundation
import UIKit

extension UIViewController {
    @nonobjc class var tabBarViewController: UIViewController? {
        return UIStoryboard(name: "Tabbar", bundle: nil).instantiateViewController(withIdentifier: "TabbarViewController")
    }
    @nonobjc class var HomeViewController: UIViewController? {
        return UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController")
    }
}