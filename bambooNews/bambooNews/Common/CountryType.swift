//
//  CountryType.swift
//  bambooNews
//
//  Created by Georgina Rubira Pairó on 11/03/2021.
//

import Foundation

enum CountryType: String, CaseIterable {
    case unitedStates = "us"
    case mexico = "mx"
    case japon = "jp"
    
    var name: String {
        switch self {
        case .unitedStates:
           return  "U.S.A"
        case .mexico:
            return "Mexico"
        case .japon:
          return  "Japan"
        }
        
    }
  
    
    
}
