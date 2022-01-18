//
//  PopularCollectionViewCell.swift
//  Task
//
//  Created by vignesh kumar c on 11/01/22.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PopularCollectionViewCell"
    
    let baseUrl = "https://dawar.nyc3.digitaloceanspaces.com/"

    @IBOutlet weak var popularBrandLbl: UILabel!
    
    @IBOutlet weak var popularBrandImage: UIImageView!
    
    func setup(dish: BrandsData) {
        popularBrandLbl.text = dish.name
        popularBrandImage.kf.setImage(with: (baseUrl + dish.image!).asUrl)
    }
    
}
