//
//  TabbarProtocols.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/19/22.
//

import Foundation
import UIKit


protocol TabBarViewProtocol: AnyObject {
    var presenter: TabBarPresenterProtocol? { get set }
}

protocol TabBarPresenterProtocol: AnyObject {
    var view: TabBarViewProtocol? { get set }
    var router: TabBarRouterProtocol? { get set }
}

protocol TabBarRouterProtocol: AnyObject {
    static func createModule() -> UIViewController?
}
