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
   
    @IBOutlet var entradetaLabel: UITextView!
    
    @IBAction func navigationTapped(_ sender: Any) {

        guard let stringUrl: String = articleSeleccionado?.url,
              let url = URL(string: stringUrl) else {return}
        UIApplication.shared.open(url)
    }
    
    let articleSeleccionado = NewsViewModel.selectedArticle
    let sourceSeleccionada = NewsViewModel.selectedSource
    
    
    func setImage()  {
        imageDetail.image = nil
        if let stringUrltoImage = articleSeleccionado?.urlToImage {
            if let url = URL(string: stringUrltoImage) {
                imageDetail.af.setImage(withURL: url)
            }
        }
    }
    
   private func configureView() {
        self.title = articleSeleccionado?.source.name
        headlineLabel.text = articleSeleccionado?.title
        authorLabel.text = articleSeleccionado?.author
        dateLabel.text = articleSeleccionado?.publishedAtFormatted
    entradetaLabel.text = "\(articleSeleccionado?.description ?? "Descripción no disponible.")\n\n\n" + "Fuente: \(sourceSeleccionada?.name ?? "No disponible.")\n" + "\(sourceSeleccionada?.description ?? "")"
        setImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
}
