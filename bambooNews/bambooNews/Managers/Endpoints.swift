//
//  EndPoints.swift
//  bambooNews
//
//  Created by Georgina Rubira Pairó on 11/03/2021.
//

import Foundation


enum Endpoints: String {

    case topHeadlines = "https://newsapi.org/v2/top-headlines"

    var url: String {
        return self.rawValue
    }

}
