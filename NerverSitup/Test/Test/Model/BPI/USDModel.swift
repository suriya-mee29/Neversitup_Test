//
//  USDModel.swift
//  Test
//
//  Created by Suriya on 28/9/2565 BE.
//

import Foundation

protocol BPI {
    var code : String? {get set}
    var symbol : String? {get set}
    var rate : String? {get set}
    var description : String? {get set}
    var rate_float : Double? {get set}
}

struct USDModel : BPI , Codable{
    var code: String?
    
    var symbol: String?
    
    var rate: String?
    
    var description: String?
    
    var rate_float: Double?
    
    
}
