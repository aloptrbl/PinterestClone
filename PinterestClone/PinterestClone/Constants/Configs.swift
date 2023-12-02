//
//  Configs.swift
//  PinterestClone
//
//  Created by Mohamad Zulhilmi on 02/12/2023.
//

import Foundation

class Configs {
    
    // MARK: Singleton
    static let sharedInstance: Configs = {
        let instance = Configs()
        return instance
    }()
    
    // MARK: Configurable Properties
    private(set) public var baseURL = ""
    private(set) public var apiKey = ""
}
