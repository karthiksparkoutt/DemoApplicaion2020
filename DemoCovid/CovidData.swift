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
    var checkTimeEt : String
    var lastUpdateEt : String
    var positive : String
    var negative : String
    var recovered : String
    
init(covidDataListJson:JSON) {
    self.state = covidDataListJson["state"].stringValue
    self.checkTimeEt = covidDataListJson["checkTimeEt"].stringValue
    self.lastUpdateEt = covidDataListJson["lastUpdateEt"].stringValue
    self.positive = covidDataListJson["positive"].stringValue
    self.negative = covidDataListJson["negative"].stringValue
    self.recovered = covidDataListJson["recovered"].stringValue

    }}
