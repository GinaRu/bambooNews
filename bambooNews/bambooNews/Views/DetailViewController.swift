//
//  DetailViewController.swift
//  bambooNews
//
//  Created by Georgina Rubira Pairó on 12/03/2021.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class DetailViewController: UIViewController {
    @IBOutlet var headlineLabel: UILabel!
    
    @IBOutlet var authorLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var imageDetail: UIImageView!
    
    @IBOutlet var entradetaLabel: UILabel!
    
    @IBAction func navigationTapped(_ sender: Any) {
    }
    
    let articleSeleccionado = NewsViewModel.selectedArticle
    
    
    func setImage()  {
        imageDetail.image = nil
        if let stringUrltoImage = articleSeleccionado?.urlToImage {
            if let url = URL(string: stringUrltoImage) {
                imageDetail.af.setImage(withURL: url)
            }
        }

    }
    
    override func viewDidLoad() {
        headlineLabel.text = articleSeleccionado?.title
        authorLabel.text = articleSeleccionado?.author
        dateLabel.text = articleSeleccionado?.publishedAt
        entradetaLabel.text = articleSeleccionado?.description
        setImage()
        
    }
    
}
