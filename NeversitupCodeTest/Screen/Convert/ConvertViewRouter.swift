//
//  ConvertViewRouter.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/22/22.
//

import Foundation
import UIKit

class ConvertViewRouter {
    
    static func createModule( isFromHome : Bool?) -> UIViewController? {
        guard let view = UIViewController.ConvertViewController as? ConvertViewController else { return nil }
        view.isFromHome = isFromHome
        return view
    }
    
    
}
