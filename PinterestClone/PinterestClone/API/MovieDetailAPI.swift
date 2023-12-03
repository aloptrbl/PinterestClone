//
//  MovieDetailAPI.swift
//  PinterestClone
//
//  Created by Mohamad Zulhilmi on 03/12/2023.
//

import Foundation
import Alamofire

class MovieDetailAPI: BaseAPI {
    
    // MARK: Init
    init(search: String, page: String? = nil, type: String? = nil, year: String? = nil, completion: ((_ movie: MovieDetail) -> ())?) {
        super.init()
        var parameters = ""
        if let search = search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            parameters += "&i=\(search)"
        }
        if let page = page?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            parameters += "&page=\(page)"
        }
        if let type = type?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            parameters += "&type=\(type)"
        }
        if let year = year?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            parameters += "&y=\(year)"
        }
    
            parameters += "&plot=full"
        
        baseURL = Configs.sharedInstance.baseURL + parameters
        AF.request(baseURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let jsonData = response.data
                let decoder = JSONDecoder()
                do {
                    let movieData = try decoder.decode(MovieDetail.self, from: jsonData!)
                    completion?(movieData.self)
                } catch {
                    print("Error decoding JSON: \(error)")
                }

            case .failure(let error):
                print(error)
            }
            
        }
        
    }
}
