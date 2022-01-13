//
//  FoodListTableViewCell.swift
//  Task
//
//  Created by vignesh kumar c on 12/01/22.
//

import UIKit

class FoodListTableViewCell: UITableViewCell {

    let baseUrl = "https://dawar.nyc3.digitaloceanspaces.com/"
   
    @IBOutlet weak var foodImgView: UIImageView!

    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    func setup(foodList: Item) {
        
        foodName.text = foodList.name
        descriptionLbl.text = foodList.itemDescription
        priceLbl.text = foodList.foodOffer
        foodImgView.kf.setImage(with:(baseUrl + foodList.image!).asUrl)

    }
    
}
