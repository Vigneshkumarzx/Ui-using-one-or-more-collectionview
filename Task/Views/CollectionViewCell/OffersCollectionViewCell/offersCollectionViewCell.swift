//
//  offersCollectionViewCell.swift
//  Task
//
//  Created by vignesh kumar c on 10/01/22.
//

import UIKit
import Kingfisher

class offersCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: offersCollectionViewCell.self)

    @IBOutlet weak var imageView: UIImageView!
    
    
    
    func setup(offers: Offers) {
        
        imageView.kf.setImage(with: offers.image.asUrl )
        
    }
}
