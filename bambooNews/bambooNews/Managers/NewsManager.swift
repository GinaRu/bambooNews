//
//  NewsManager.swift
//  bambooNews
//
//  Created by Georgina Rubira Pairó on 11/03/2021.
//

import Foundation
import Alamofire

struct NewsManager {
    let apiKeyValue: String = "52a947bcb8034cebb623beabf333bc2a"
    
    func fetchHeadlines (countryID: CountryType,
                         success: @escaping (ArticleList) -> (),
                         failure: @escaping (APIError)-> ()) {
        
        let url = Endpoints.topHeadlines.url
        let parameters: [String:String] = [
            EndpointParameter.country.rawValue : countryID.rawValue, EndpointParameter.apiKey.rawValue : apiKeyValue] //Aquí construim el diccionari que fa referència al JSON -> "country" = "us" per exemple
        
        AF.request(url, parameters: parameters).validate().responseDecodable(of: ArticleList.self) { (response) in
            
            guard let articleList: ArticleList = response.value  else  { return }
            success(articleList)

        }
        
        
    }
    

    func fetchEverything (userSearch: String,
                          success: @escaping (ArticleList) -> (),
                          failure: @escaping (APIError)-> ()) {
         
         let url = Endpoints.everything.url
         let parameters: [String:String] = [
            EndpointParameter.query.rawValue : userSearch, EndpointParameter.apiKey.rawValue : apiKeyValue]
            
         
         AF.request(url, parameters: parameters).validate().responseDecodable(of: ArticleList.self) { (response) in
             
             guard let articleList: ArticleList = response.value  else  { return }
             success(articleList) // Aquí tenim la llista d'articles que buscavem. Quan ho cridem al viewController li anomenarem news. 
         }
    
}
    
    func fetchSources (
    success: @escaping (SourceList) -> (),
    failure: @escaping (APIError)-> ()) {

let url = Endpoints.source.url
let parameters: [String:String] = [
EndpointParameter.apiKey.rawValue : apiKeyValue]


AF.request(url, parameters: parameters).validate().responseDecodable(of: SourceList.self) { (response) in

guard let sourceList: SourceList = response.value  else  { return }
success(sourceList) // Aquí tenim la llista de sources que buscavem. Quan ho cridem al viewController li anomenarem fuentes.
}

}
    
    
    
}
