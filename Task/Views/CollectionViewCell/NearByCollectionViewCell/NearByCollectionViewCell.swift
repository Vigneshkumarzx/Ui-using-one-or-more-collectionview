//
//  NearByCollectionViewCell.swift
//  Task
//
//  Created by vignesh kumar c on 12/01/22.
//

import UIKit

class NearByCollectionViewCell: UICollectionViewCell {
    
    let baseUrl = "https://dawar.nyc3.digitaloceanspaces.com/"
    
    
    
    @IBOutlet weak var restImg: UIImageView!
    
    static let identifier = "NearByCollectionViewCell"

    func setup(restaurants: Restaurant) {
        
       
        restImg.kf.setImage(with: (baseUrl + restaurants.image).asUrl)
        
    }
}
