//
//  NetworkError.swift
//  Test
//
//  Created by Suriya on 28/9/2565 BE.
//

import Foundation
import Alamofire
struct NetworkError: Error {
  let initialError: AFError
  let backendError: BackendError?
}


