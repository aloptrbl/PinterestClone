//
//  Movies.swift
//  PinterestClone
//
//  Created by Mohamad Zulhilmi on 02/12/2023.
//

import Foundation

struct Movie: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

struct HomeFeed: Codable {
    let search: [Movie]
       let totalResults: String
       let response: String

       enum CodingKeys: String, CodingKey {
           case search = "Search"
           case totalResults
           case response = "Response"
       }
}


