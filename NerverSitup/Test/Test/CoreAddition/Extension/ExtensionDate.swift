//
//  ExtensionDate.swift
//  Test
//
//  Created by Suriya on 29/9/2565 BE.
//

import Foundation
extension Date {
  
    func getFormattedByLocal(format : String , local : String)->String{
        let formater = DateFormatter()
        formater.dateFormat = format
        formater.locale = NSLocale(localeIdentifier: local) as Locale
        return formater.string(from: self)
    }
}
