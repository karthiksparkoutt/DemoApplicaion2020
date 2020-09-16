//
//  CovidData.swift
//  DemoCovid
//
//  Created by Karthik Rajan T  on 16/09/20.
//  Copyright © 2020 Karthik Rajan T . All rights reserved.
//


import Foundation
import SwiftyJSON

class CovidData{
    var state : String
    var date : Int
    var positive : Int
    var negative : Int
    var recovered : Int
    
init(covidDataListJson:JSON) {
    self.state = covidDataListJson["state"].stringValue
    self.date = covidDataListJson["date"].intValue
    self.positive = covidDataListJson["positive"].intValue
    self.negative = covidDataListJson["negative"].intValue
    self.recovered = covidDataListJson["recovered"].intValue

    }}
