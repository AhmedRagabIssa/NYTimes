//
//  Article.swift
//  NYTimes
//
//  Created by Fathi on 3/10/19.
//

import Foundation

struct Article: Codable {
    var title: String?
    var abstract: String?
    var publishedDate: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case abstract
        case publishedDate = "published_date"
    }
}
