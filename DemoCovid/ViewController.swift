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
        cell.categoryListLabel.text = users[indexPath.row].state
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BarChartViewController") as! BarChartViewController
        self.addChild(popOverVC)
        popOverVC.getPositive = users[indexPath.row].positive
        popOverVC.getstate = users[indexPath.row].state
        // popOverVC.getImage = imageProfile[indexPath.row] as! UIImage
        // popOverVC.getName = name[indexPath.row] as! String
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
}
