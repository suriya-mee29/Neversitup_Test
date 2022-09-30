//
//  CurrentpriceModel.swift
//  Test
//
//  Created by Suriya on 28/9/2565 BE.
//

import Foundation

struct CurrentpriceModel : Codable{
    
    let time : DateModel?
    let disclaimer : String?
    let chartName : String?
    let bpi : BPIModel?
}
