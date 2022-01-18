//
//  LocationHeaderView.swift
//  CapitaStar@Work
//
//  Created by Sarathkumar sekar on 22/07/21.
//  Copyright © 2021 Capitaland. All rights reserved.
//

import UIKit

class RestarauntHeaderView: UITableViewHeaderFooterView {

    // MARK: - Views
    @IBOutlet weak var headerNameLabel: UILabel!

    // MARK: - Values
    static let identifier = "LocationHeaderView"
    static func nib() -> UINib {
        return UINib(nibName: "LocationHeaderView", bundle: nil)
    }
}
