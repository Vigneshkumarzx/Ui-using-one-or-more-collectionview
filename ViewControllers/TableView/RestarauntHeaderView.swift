
//

import UIKit

class RestarauntHeaderView: UITableViewHeaderFooterView {

    // MARK: - Views

    @IBOutlet weak var restImage: UIImageView!
    // MARK: - Values
    static let identifier = "RestarauntHeaderView"
    static func nib() -> UINib {
        return UINib(nibName: "RestarauntHeaderView", bundle: nil)
    }
}
