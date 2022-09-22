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
    var currencyData = [currencyModel]()
    
    var currencyList : currencyListModel?{
        didSet {
            self.currencyData.removeAll()
            for i in (currencyList?.bpi?.values)!{
                let data = i as! [String : Any]
                currencyData.append(currencyModel(JSON: data)!)
            }
            self.tableView.reloadData()
            print(LocalStorageManager.shared.getData())
        }
    }
    
   weak var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalView()
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(reloadCurrencyData), userInfo: nil, repeats: true)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
    
    @objc func reloadCurrencyData(){
        getData()
    }
    
    func initalView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(HomeListTableCell.createNib(), forCellReuseIdentifier: cellId )
    }
    
    func getData(){
        presenter?.getCurrentPriceList()
    }
    
    @IBAction func clickConvertBtn(_ sender: Any) {
        presenter?.presentToCovertView()
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
        let currencyType = Utility().getCurrenyType(obj.code ?? "USD")
        cell.lblCurrencyName.text = Utility().flag(currencyType) + (obj.code ?? "")
        cell.lblCurrencyDesc.text = obj.description
        cell.lblCurrencyRate.text = Utility().getCurrencySign(currencyType) + " " + (obj.rate ?? "-")
        
        return cell
    }
}

extension HomeViewController  : HomeViewProtocol {
    func showCurrencyList(_ data: currencyListModel) {
        self.currencyList = data
        
    }
    
    
}
