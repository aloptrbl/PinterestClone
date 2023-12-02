//
//  HomeFeedAPI.swift
//  PinterestClone
//
//  Created by Mohamad Zulhilmi on 02/12/2023.
//

import Foundation
import Alamofire

class HomeFeedAPI: BaseAPI {
    
    // MARK: Init
    init(search: String, page: String, type: String? = nil, year: String? = nil, completion: ((_ moviesArr: [Movie]?) -> ())?) {
        super.init()
        var parameters = ""
        if let search = search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            parameters += "&s=\(search)"
        }
        if let page = page.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            parameters += "&page=\(page)"
        }
        if let type = type?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            parameters += "&type=\(type)"
        }
        if let year = year?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            parameters += "&y=\(year)"
        }
        baseURL = Configs.sharedInstance.baseURL + parameters
        AF.request(baseURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let jsonData = response.data
                let decoder = JSONDecoder()
                let movieData = try! decoder.decode(HomeFeed.self, from: jsonData!)
                completion?(movieData.search)
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
}
