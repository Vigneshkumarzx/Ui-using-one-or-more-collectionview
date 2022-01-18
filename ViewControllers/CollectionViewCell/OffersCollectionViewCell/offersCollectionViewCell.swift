//
//  offersCollectionViewCell.swift
//  Task
//
//  Created by vignesh kumar c on 10/01/22.
//

import UIKit
import Kingfisher

class offersCollectionViewCell: UICollectionViewCell {
    
    let baseUrl = "https://dawar.nyc3.digitaloceanspaces.com/"
    
    static let identifier = String(describing: offersCollectionViewCell.self)

    @IBOutlet weak var imageView: UIImageView!
    
    

    func setup(offers: Datum) {
        
        imageView.kf.setImage(with: (baseUrl + offers.image).asUrl)
        
    }
}
