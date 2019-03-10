//
//  Response.swift
//  NYTimes
//
//  Created by Fathi on 3/10/19.
//

import Foundation

struct Response: Codable {
    var status: String?
    var copyright: String?
    var numResults: Int?
    var results: [Article]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case copyright
        case numResults = "num_results"
        case results
    }
}
