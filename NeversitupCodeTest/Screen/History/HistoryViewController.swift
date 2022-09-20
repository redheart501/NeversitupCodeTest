//
//  HistoryViewController.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/19/22.
//

import Foundation
import UIKit

class HistoryViewController : UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    private let cellId = "HistoryListTableCell"
    
    var presenter : HistoryPresenterProtocol?
    var historyDataList : [HistoryRateObject]?{
        didSet{
            refreshControl.endRefreshing()
            historyDataList?.reverse()
            self.tableView.reloadData()
        }
    }
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        initialView()
        getList()
    }
    
    func initialView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(HistoryListTableCell.createNib(), forCellReuseIdentifier: cellId )
        refreshControl.addTarget(self, action: #selector(pulltoRefresh), for: UIControl.Event.valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    func getList(){
        presenter?.getHistoryList()
    }
    
    @objc func pulltoRefresh(){
        getList()
        
    }
    @IBAction func clickBtnClear(_ sender: Any) {
        presenter?.deleteDatabase()
       
    }
}

extension HistoryViewController : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.historyDataList?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as? HistoryListTableCell else {
           
            return UITableViewCell()
        }
        let obj = self.historyDataList?[indexPath.row]
       
        cell.lblDate.text = "\(DateFomatterHelper().getDate(timeString: obj?.updatedISO ?? ""))"
        cell.lblUSD_price.text =    Utility().getCurrencySign(.USD) + "" + String(obj?.USD_Price ?? 0.0)
        cell.lblEU_price.text = Utility().getCurrencySign(.EUR) + "" + String(obj?.EUR_Price ?? 0.0)
        cell.lblGBP_price.text = Utility().getCurrencySign(.GBP) + "" + String(obj?.GBP_Price ?? 0.0)
        
        return cell
    }
    
    
    
    
}

extension HistoryViewController : HistoryViewProtocol{
    func showDeletingAlert() {
        let alert = UIAlertController(title: "Deleted All History", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: {_ in
            self.historyDataList?.removeAll()
            self.tableView.reloadData()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func showHistoryList(_ data: [HistoryRateObject]) {
        self.historyDataList = data
    }
    
    
}
