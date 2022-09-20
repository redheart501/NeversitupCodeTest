//
//  ViewController.swift
//  NeversitupCodeTest
//
//  Created by Kyaw Ye Htun on 9/19/22.
//

import UIKit
import ObjectMapper
class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let cellId = "HomeListTableCell"
    var presenter : HomePresenterProtocol?
    var currencyData = [NSDictionary]()
    var currencyList : currencyListModel?{
        didSet {
            for i in (currencyList?.bpi?.values)!{
               let data = i as! NSDictionary
                currencyData.append(data)
            }
            print(currencyData )
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        initalView()
    }
    
    func initalView(){
        tableView.register(HomeListTableCell.createNib(), forCellReuseIdentifier: cellId )
        presenter?.getCurrentPriceList()
    }

}

extension HomeViewController : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currencyList?.bpi?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as? HomeListTableCell else {
           
            return UITableViewCell()
        }
        let obj = currencyData[indexPath.row]
        
        let code = obj.object(forKey: "code") as? String
        let desc = obj.object(forKey: "description") as? String
        let rate = obj.object(forKey: "rate") as? String
        
        //Another Ways of Get Data
//        switch indexPath.row{
//        case 0:
//            code = self.currencyList?.USD?.code ?? ""
//            desc = self.currencyList?.USD?.description ?? ""
//            rate = self.currencyList?.USD?.rate ?? ""
//            break
//        case 1:
//            code = self.currencyList?.EUR?.code ?? ""
//            desc = self.currencyList?.EUR?.description ?? ""
//            rate = self.currencyList?.EUR?.rate ?? ""
//            break
//        case 2:
//            code = self.currencyList?.GBP?.code ?? ""
//            desc = self.currencyList?.GBP?.description ?? ""
//            rate = self.currencyList?.GBP?.rate ?? ""
//            break
//        default:
//            break
//        }
        cell.lblCurrencyName.text = code
        cell.lblCurrencyDesc.text = desc
        cell.lblCurrencyRate.text = rate
        return cell
    }
}

extension HomeViewController  : HomeViewProtocol {
    func showCurrencyList(_ data: currencyListModel) {
        self.currencyList = data
        
    }
    
    
}
