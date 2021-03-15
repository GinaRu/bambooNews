//
//  SourceList.swift
//  bambooNews
//
//  Created by Georgina Rubira Pairó on 15/03/2021.
//

import Foundation

struct SourceList: Decodable {
    let status: String
    let sources: [Source]
    
    enum CodingKeys: String, CodingKey {
        case status
        case sources
    }

}
