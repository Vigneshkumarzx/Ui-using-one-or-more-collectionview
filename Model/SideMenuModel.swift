//
//  SideMenuModel.swift
//  Task
//
//  Created by vignesh kumar c on 10/01/22.
//

import Foundation
import UIKit

protocol MenuListControllerDelegate {
    
    func didSelectItems(named: SideMenuItem)
        
}

enum SideMenuItem:String, CaseIterable {
    
    case home = "Home"
    case YourOrders = "Your Orders"
    case viewcart = "ViewCart"
    
    var imageName: String {
        switch self {
        case .home:
            return "house"
        case .YourOrders:
            return "note"
        case .viewcart:
            return "bag"
        }
    }
    
}

class MenuListController: UITableViewController {
    
    var delegate: MenuListControllerDelegate?
    
    var menuItems: [SideMenuItem]
    init(with menuItems: [SideMenuItem]){
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let darkColour = UIColor.purple
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = darkColour
    
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return menuItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkColour
        cell.imageView?.image = UIImage(systemName: menuItems[indexPath.row].imageName)
        cell.imageView?.tintColor = .white
        return cell
}
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selecteditem = menuItems[indexPath.row]
        delegate?.didSelectItems(named: selecteditem)

    }
//    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
//        let imageView = UIImageView(frame: CGRect(x: 5, y: 8, width: 40, height: 40))
//        let image = UIImage(named: "person")!
//        imageView.image = image
//        header.contentView.addSubview(imageView)
//        view.backgroundColor = UIColor.clear
//    }

    
}
