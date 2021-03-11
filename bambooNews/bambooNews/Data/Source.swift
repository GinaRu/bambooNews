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
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
