//
//  UIView+Extension.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/20/22.
//

import Foundation
import UIKit

extension UIView{
    
    func hideKeyboardWhenTappedAround(_ delegate: UIGestureRecognizerDelegate? = nil) {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIView.dismissKeyboard))
        tap.cancelsTouchesInView = true
        tap.delegate = delegate
        addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        endEditing(true)
    }
}
