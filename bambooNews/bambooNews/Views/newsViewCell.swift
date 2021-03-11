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
    
  
    
    override func setSelected(_ selected: Bool, animated: Bool) {
   //     imageViewCell.af.setImage(withURL: )
        // Hem d'esbrinar com crear una URL de tipus URL a partir de l'String que teniem. 
    }
    
    
    func configure(with article: Article) {
        // Aquí hem de fer algo perque cridant aquesta funció al view controller ens construeixi el titol i el que calgui. 
    }
}
