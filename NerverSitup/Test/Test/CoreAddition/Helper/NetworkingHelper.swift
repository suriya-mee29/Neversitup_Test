//
//  NetworkingHelper.swift
//  Test
//
//  Created by Suriya on 28/9/2565 BE.
//

import Foundation
import Combine
import Alamofire

protocol NetworkingHelperProtocal {
    func fetchBPI() -> AnyPublisher<DataResponse<CurrentpriceModel,NetworkError>,Never>
}
class NetworkingHelper: NetworkingHelperProtocal {
    
    static let shared: NetworkingHelperProtocal = NetworkingHelper()
    private init() { }
}

extension NetworkingHelper {
    func fetchBPI() -> AnyPublisher<Alamofire.DataResponse<CurrentpriceModel, NetworkError>, Never> {
        let url = URLConstants.getCurrentpriceURL()
        return AF.request(url,method: .get)
            .validate()
            .publishDecodable(type : CurrentpriceModel.self)
            .map{ res in
                res.mapError { error in
                    let backendError = res.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
