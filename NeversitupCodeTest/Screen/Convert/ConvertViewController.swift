//
//  ConvertViewController.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/19/22.
//

import Foundation
import UIKit

class ConvertViewController : UIViewController{
    
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var inputTextfield: UITextField!
    @IBOutlet weak var lblOutputBtcValue: UILabel!
    
    var currencyType : CurrencyType = .USD
    
    //Implememnt for pop up button
    private lazy var USD = UIAction(title: "🇺🇸 USD",attributes: [], state: .off) { action in
        self.currencyType = .USD
        self.btnMenu.setTitle("🇺🇸 USD", for: .normal)
       
    }
    
    private lazy var EUR = UIAction(title: "🇪🇺 EUR", attributes: [], state: .off) { action in
        self.currencyType = .EUR
        self.btnMenu.setTitle("🇪🇺 EUR", for: .normal)
    }
    
    private lazy var GBP = UIAction(title: "🇬🇧 GBP", image: nil, attributes: [], state: .off) { action in
        self.currencyType = .GBP
        self.btnMenu.setTitle("🇬🇧 GBP", for: .normal)
    }
    
    private lazy var elements: [UIAction] = [USD, EUR, GBP]
    private lazy var menu = UIMenu(title: "Select", children: elements)
    
    
    override func viewDidLoad() {
        
        self.btnMenu.menu = menu
        self.btnMenu.showsMenuAsPrimaryAction = true
        self.view.hideKeyboardWhenTappedAround()
    }
    
    
    @IBAction func textEditingChanged(_ sender: Any) {
        var price : Float = 0.0
        switch currencyType{
        case .USD:
           price = LocalStorageManager.shared.getData().last?.USD_Price ?? 0.0
            break
        case .GBP:
            price = LocalStorageManager.shared.getData().last?.GBP_Price ?? 0.0
            break
        case .EUR:
            price = LocalStorageManager.shared.getData().last?.EUR_Price ?? 0.0
            break
        }
        let inputValue = (Float(self.inputTextfield.text ?? "0.0") ?? 0.0) / price
        self.lblOutputBtcValue.text = "\(inputValue)"
        
    }
    
}
