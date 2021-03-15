//
//  EndPoints.swift
//  bambooNews
//
//  Created by Georgina Rubira Pairó on 11/03/2021.
//

import Foundation


enum Endpoints: String {

    case topHeadlines = "https://newsapi.org/v2/top-headlines"
    case everything = "https://newsapi.org/v2/everything"
    case source = "https://newsapi.org/v2/sources"

    var url: String {
        return self.rawValue
    }

}

enum EndpointParameter: String {
    case query = "q"
    case apiKey
    case country
}
