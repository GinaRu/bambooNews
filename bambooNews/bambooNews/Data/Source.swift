//
//  Source.swift
//  bambooNews
//
//  Created by Georgina Rubira Pairó on 11/03/2021.
//

import Foundation

struct Source: Decodable {
    let id: String?
    let name: String
    let description: String?
    let url: String?
    let category: String?
    let language: String?
    let country: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case url
        case category
        case language
        case country
    }
}
