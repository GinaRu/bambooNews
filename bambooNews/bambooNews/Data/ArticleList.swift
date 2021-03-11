//
//  ArticleList.swift
//  bambooNews
//
//  Created by Georgina Rubira Pairó on 11/03/2021.
//

import Foundation

struct ArticleList: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
    
    enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case articles
    }
}
