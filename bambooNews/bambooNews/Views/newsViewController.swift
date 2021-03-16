//
//  newsViewController.swift
//  bambooNews
//
//  Created by Georgina Rubira Pairó on 10/03/2021.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class newsViewController: UITableViewController {
    private let reuseIdentifier = String(describing: newsViewCell.self)
    
    
    @IBOutlet var userSearch: UITextField!
    
    @IBOutlet var newstableView: UITableView!
    
    let newsManager = NewsManager()
    var articles: [Article]?
    var sources: [Source]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        newstableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
        
        userSearch.delegate = self
        
        
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
        
        newsManager.fetchSources(success: { (fuentes) in
           self.sources = fuentes.sources
               print("$$ \(fuentes)")
          }, failure: { (error) in
              print(error.message)
         })
        
    }
    
   
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPosition: Int = indexPath.row
    
    
    // HEEEEEEEEEEEY
    
    let art: Article? = articles?[selectedPosition]
    NewsViewModel.selectedArticle = art
    
    NewsViewModel.selectedSource = nil
    let sourceID = art?.source.id
    if let sourcesUnwraped = sources {
        for s in sourcesUnwraped {
            if sourceID == s.id {
            NewsViewModel.selectedSource = s
        }
            
        }
   
        
    }
    
    
    performSegue(withIdentifier: "SegueToDetail", sender: nil)
        
        print("Has seleccionado la fila \(selectedPosition)")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let titles = articles?[indexPath.row].title ?? "Headline NO encontrada"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        if let newsViewCell = cell as? newsViewCell {
            if let article = articles?[indexPath.row] {
                newsViewCell.configure(with: article)
            }

        }
        return cell
    }
   
 
    
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    

}

extension newsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let search = userSearch.text else { return false}
            newsManager.fetchEverything(userSearch: search, success: { (news) in
                self.articles = news.articles
                self.tableView.reloadData()
    },
               failure: { (error) in
                print(error.message)
    })
        print("El usuario ha buscado \(search)")
        self.userSearch.resignFirstResponder()
        return true
}
}
