//
//  newsViewController.swift
//  bambooNews
//
//  Created by Georgina Rubira Pairó on 10/03/2021.
//

import Foundation
import UIKit
import Alamofire

class newsViewController: UITableViewController {
    

    override func viewDidLoad() {
        let newsManager: NewsManager = NewsManager()
        newsManager.fetchHeadlines(countryID: "us", success: { (articles) in
            print("Num \(articles.totalResults)")
        }, failure: { (error) in
            print("Error")
    })
        
    }
}
