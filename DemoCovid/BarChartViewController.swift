//
//  BarChartViewController.swift
//  DemoCovid
//
//  Created by Karthik Rajan T  on 16/09/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit
import Charts

class BarChartViewController: UIViewController, ChartViewDelegate {
    @IBOutlet weak var barChartView: BarChartView!
    var getPositive = ""
    var getState = ""
    var getNegative = ""
    var dataArray = [CovidData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
    }
    func loadData() {
        var xAxisArray = [Double]()
        var yAxisArray = [Double]()
        
        for data in dataArray {
            let xData = Double(data.state) ?? 0.0
            let yData = Double(data.positive) ?? 0.0
            xAxisArray.append((xData))
            yAxisArray.append(yData)
        }
        var dataEntries: [BarChartDataEntry] = []
                              for i in 0..<getState.count {
                                  let dataEntry = BarChartDataEntry(x: Double(xAxisArray[i]), y: Double(yAxisArray[i]))
                                  
                                  dataEntries.append(dataEntry)
                              }
                              
                              let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Covid Count")
                              let chartData = BarChartData(dataSet: chartDataSet)
                              
                              barChartView.data = chartData
    }
        func setChart() {
            let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
            let test = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
            
            var dataEntries: [BarChartDataEntry] = []
            
            for i in 0..<getState.count
           {
                let dataEntry = BarChartDataEntry(x: Double(test[i]), y: Double(unitsSold[i]))
                
                dataEntries.append(dataEntry)
            }
            
            let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Covid Count")
            let chartData = BarChartData(dataSet: chartDataSet)
            
            barChartView.data = chartData
        }
    }
