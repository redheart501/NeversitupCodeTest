//
//  ConvertViewRouter.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/22/22.
//

import Foundation
import UIKit

class ConvertViewRouter {
    
    static func createModule() -> UIViewController? {
        guard let view = UIViewController.ConvertViewController as? ConvertViewController else { return nil }
        return view
    }
    
    
}
