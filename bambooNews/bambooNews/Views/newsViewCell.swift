//
//  newsViewCell.swift
//  bambooNews
//
//  Created by Georgina Rubira Pairó on 10/03/2021.
//

import UIKit
import Alamofire
import AlamofireImage

class newsViewCell: UITableViewCell {

    @IBOutlet var imageViewCell: UIImageView!
    @IBOutlet var labelCell: UILabel!
        
    override func awakeFromNib() {
        
    }

    
    func configure(with article: Article) {
        labelCell.text = article.title
        
        imageViewCell.image = nil
        if let stringUrltoImage = article.urlToImage {
            if let url = URL(string: stringUrltoImage) {
                imageViewCell.af.setImage(withURL: url)
            }
        }
    }
}

