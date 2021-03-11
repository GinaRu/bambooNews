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
    private let reuseIdentifier = String(describing: newsViewCell.self)
    
    @IBOutlet var newstableView: UITableView!
    
    let newsManager = NewsManager()
    var articles: [Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        newstableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
        
        newsManager.fetchHeadlines(countryID: CountryType.unitedStates,
                                   success: { (news) in
                                    self.articles = news.articles
// news és de tipus ArticleList i estem cridant a la seva propietat articles perquè la variable articles es correspongui només amb els articles dins de ArticleList.
                                    self.tableView.reloadData()
            print("Num \(news.totalResults)")
        },
                                   failure: { (error) in
                                    print(error.message)
    })
        
    }
    
   
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPosition: Int = indexPath.row
        print("Has seleccionado la fila \(selectedPosition)")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let titles = articles?[indexPath.row].title ?? "Headline NO encontrada"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        if let newsViewCell = cell as? newsViewCell {
            newsViewCell.labelCell.text = "\(titles)"
        }
        return cell
    }
   
    
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    

}
