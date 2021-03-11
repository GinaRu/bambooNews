//
//  APIError.swift
//  bambooNews
//
//  Created by Georgina Rubira Pairó on 11/03/2021.
//

import Foundation

struct APIError: Decodable {
    let status: String
    let code: String
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case status
        case code
        case message
    }
}
