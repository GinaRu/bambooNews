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
    let newsManager = NewsManager()
    var articles: [Article]?
    var sources: [Source]?
    
    @IBOutlet var userSearch: UITextField!
    @IBOutlet var newstableView: UITableView!
    @IBOutlet var segmentedTriat: UISegmentedControl!
    
    @IBAction func segmentedPulsado(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        let countrySelected: CountryType = CountryType.allCases[selectedIndex]
            fetchSegonsPais(countrySelected)
    }
    

    func loadFirstCountryNews () {
        let countryIndex = 0
        segmentedTriat.selectedSegmentIndex = countryIndex
        fetchSegonsPais(CountryType.allCases[countryIndex])
    }
    func fetchSegonsPais(_ pais: CountryType) {
        newsManager.fetchHeadlines(countryID: pais,
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
    func setUpSegmentedControl() {
        segmentedTriat.removeAllSegments()
        var segmentIndex = 0
        for segment in CountryType.allCases {
            segmentedTriat.insertSegment(withTitle: segment.name, at: segmentIndex, animated: false)
            segmentIndex += 1
        }
        
    }
    func fetchSources () {
        newsManager.fetchSources(success: { (fuentes) in
           self.sources = fuentes.sources
            // Aquest (fuentes) és la llista de sources que ens ha retornat.
               print("$$")
          }, failure: { (error) in
              print(error.message)
         })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        newstableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
        userSearch.delegate = self
        setUpSegmentedControl()
        loadFirstCountryNews()
        fetchSources()
    }
    
   
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPosition: Int = indexPath.row
    
    
    // AQUÍ RELACIONEM L'ARTICLE SELECCIONAT AMB LA FONT SELECCIONADA:
    
    let art: Article? = articles?[selectedPosition]
    NewsViewModel.selectedArticle = art
    
    NewsViewModel.selectedSource = nil
    // Li diem que és nil abans de que es construeixi ja que si en algun cas és nil apareixeria l'anterior.
    let sourceID = art?.source.id
    if let sourcesUnwraped = sources {
        for font in sourcesUnwraped {
            if sourceID == font.id {
            NewsViewModel.selectedSource = font
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
