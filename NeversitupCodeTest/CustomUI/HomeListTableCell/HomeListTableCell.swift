//
//  HomeListTableCell.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/19/22.
//

import Foundation
import UIKit

class HomeListTableCell : UITableViewCell {
    
    @IBOutlet weak var lblCurrencyName: UILabel!
    @IBOutlet weak var lblCurrencyDesc: UILabel!
    @IBOutlet weak var lblCurrencyRate: UILabel!
    
    class func createNib() -> UINib? {
        return UINib(nibName: "homeListTableCell", bundle: nil)
    }
    
}
