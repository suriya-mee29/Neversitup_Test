//
//  URLConstants.swift
//  Test
//
//  Created by Suriya on 28/9/2565 BE.
//

import Foundation
struct URLConstants{
    static let getCurrentpriceAPI = "https://api.coindesk.com/v1/bpi/currentprice.json"
    
    static func getCurrentpriceURL()-> URL{
        return URL(string: self.getCurrentpriceAPI)!
    }
}

