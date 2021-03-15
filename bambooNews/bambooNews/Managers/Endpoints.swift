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

    var url: String {
        return self.rawValue
    }

}
