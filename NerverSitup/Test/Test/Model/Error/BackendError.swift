//
//  BackendError.swift
//  Test
//
//  Created by Suriya on 28/9/2565 BE.
//

import Foundation

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
