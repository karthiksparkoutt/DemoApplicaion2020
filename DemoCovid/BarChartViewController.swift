//
//  BarChartViewController.swift
//  DemoCovid
//
//  Created by Karthik Rajan T  on 16/09/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//

import UIKit
import Charts
class BarChartViewController: UIViewController {
@IBOutlet weak var barChartView: BarChartView!
    var getPositive = Int()
    var getstate = String()
    fileprivate func extractedFunc() {
        barChartView.delegate = self
customizeChart(dataPoints: getstate)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extractedFunc()
            }
        }
//MARK: - ChartViewDelegate
extension BarChartViewController: ChartViewDelegate {
   
    func customizeChart(dataPoints: String) {
   
        let chartDataSet = BarChartDataSet(dataEntries, label: "")
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartView.data = chartData
      // TO-DO: customize the chart here
    }
    func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
      var colors: [UIColor] = []
      for _ in 0..<numbersOfColor {
        let red = Double(arc4random_uniform(256))
        let green = Double(arc4random_uniform(256))
        let blue = Double(arc4random_uniform(256))
        let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
        colors.append(color)
      }
      return colors
    }
}
