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
            "country" : countryID.rawValue, "apiKey" : apiKeyValue]
        
        AF.request(url, parameters: parameters).validate().responseDecodable(of: ArticleList.self) { (response) in
            
            guard let articleList: ArticleList = response.value  else  { return }
            success(articleList)
            // Aquí cridariem a success
            
        }
        
        
    }
    
}
