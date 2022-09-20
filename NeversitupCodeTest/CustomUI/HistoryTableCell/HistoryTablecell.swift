//
//  HistoryTablecell.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/20/22.
//

import Foundation
import UIKit

class HistoryListTableCell : UITableViewCell{
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblUSD_price: UILabel!
    @IBOutlet weak var lblEU_price: UILabel!
    @IBOutlet weak var lblGBP_price: UILabel!
    
    class func createNib() -> UINib? {
        return UINib(nibName: "HistoryTableCell", bundle: nil)
    }
}
