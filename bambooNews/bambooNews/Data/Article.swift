//
//  Article.swift
//  bambooNews
//
//  Created by Georgina Rubira Pairó on 11/03/2021.
//

import Foundation


struct Article: Decodable {
    let source: Source
    let author: String
    let title: String
    let description: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case description
        case url
    }
}

