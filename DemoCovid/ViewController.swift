//
//  ViewController.swift
//  DemoCovid
//
//  Created by Karthik Rajan T  on 16/09/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController {
    @IBOutlet weak var covidListTableView: UITableView!
    var users = [CovidData]()
    fileprivate func extractedFunc() {
        covidListTableView.delegate = self
        covidListTableView.dataSource = self
        callMyPropertiesService()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        extractedFunc()
    }
    @IBAction func liveStatusButton(_ sender: UIBarButtonItem) {
    }
    @IBAction func barChartButton(_ sender: UIBarButtonItem) {
    }
    func callMyPropertiesService(){
        DispatchQueue.main.async {
            let url = URL(string: "https://covidtracking.com/api/states")
            let urlRequest = URLRequest(url: url!)
            Alamofire.request(urlRequest)
                .responseJSON { response in
                    switch response.result{
                    case.success(let data):
                        print("Data :",data)
                        let json = JSON(data)
                        
                        let data = json.arrayValue
                        for dataObj: JSON in data {
                            self.users.append(CovidData.init(covidDataListJson: dataObj))
                        }
                        DispatchQueue.main.async {
                            self.covidListTableView.reloadData()
                        }
                    case .failure(let error):
                        print("Data",error)
                    }
            }
        }
    }
}
//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath) as! CategoryTableViewCell
        cell.stateListLabel.text = "State: "+users[indexPath.row].state
        cell.checkTimeLabel.text = "checkTimeEt: "+users[indexPath.row].checkTimeEt
        cell.lastUpdateLabel.text = "lastUpdateEt: "+users[indexPath.row].lastUpdateEt
        cell.positiveLabel.text = "positive: "+users[indexPath.row].positive
        cell.negativeLabel.text = "negative: "+users[indexPath.row].negative
        cell.recoveredLabel.text = "recovered: "+users[indexPath.row].recovered
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
