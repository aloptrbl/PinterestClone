//
//  BaseAPI.swift
//  PinterestClone
//
//  Created by Mohamad Zulhilmi on 02/12/2023.
//

import Foundation
import Alamofire

class BaseAPI {
    // Singleton instance
    static let shared = BaseAPI()
    var baseURL = Configs.sharedInstance.baseURL

    // MARK: API Request
    func request(endpoint: String, method: HTTPMethod, parameters: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default, headers: HTTPHeaders? = nil) -> DataRequest {
        return AF.request(baseURL + endpoint, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }
}

