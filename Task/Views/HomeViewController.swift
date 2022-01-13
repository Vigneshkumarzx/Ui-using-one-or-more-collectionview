//
//  ViewController.swift
//  Task
//
//  Created by vignesh kumar c on 10/01/22.
//

import UIKit
import SideMenu

class HomeViewController: UIViewController, UINavigationControllerDelegate, MenuListControllerDelegate  {
   
  
    @IBOutlet weak var offfersCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    
    @IBOutlet weak var nearbyCollectionView: UICollectionView!
    
    
      var offers = [Datum]()
 
    
    var populars = [BrandsData]()
    
    
    var nearby = [Restaurant]()
 
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offfersCollectionView.delegate = self
        offfersCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        nearbyCollectionView.delegate = self
        nearbyCollectionView.dataSource = self
        registerCells()
        getResponce()
        getneqrbyResponse()
        getofferApi()
        let list = MenuListController(with: SideMenuItem.allCases)
        list.delegate = self
        menu = SideMenuNavigationController(rootViewController: list)
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        addChildController()
    }
    
    func jsonToString(json: [String:String]) -> String{
        do {
            let data1 = try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            let convertedString = String(data: data1, encoding: String.Encoding.utf8) as NSString? ?? ""
            debugPrint(convertedString)
            return convertedString as String
        } catch let myJSONError {
            debugPrint(myJSONError)
            return ""
        }
    }

    func getResponce(){
        let parameters = ["lat" : "11.0168",  "lng" : "76.9558"]
        let jsonString = jsonToString(json: parameters)

        let postData = jsonString.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://161.35.142.163/eatzilla_v2/api/get_popular_brands?lat=11.0168&lng=76.9558")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "GET"
//        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else{ return}

            let result = try! JSONDecoder().decode(Popular.self, from: data)
            self.populars = result.brandsData!

            DispatchQueue.main.async {
                self.popularCollectionView.reloadData()
            }

        }

        task.resume()
    }

    func getofferApi(){
        let parameters = ["lat" : "11.0168",  "lng" : "76.9558"]
        let jsonString = jsonToString(json: parameters)

        let postData = jsonString.data(using: .utf8)
        
        let urlString = "http://161.35.142.163/eatzilla_v2/api/get_banners"
        
        let url = URL(string: urlString)
        guard url != nil else {
            debugPrint("URL is Nil")
            return
        }
        
        let session = URLSession.shared
        let datatask = session.dataTask(with: url!) { [self] (data, response, error ) in
            
            if error == nil , data != nil {
                let decoder = JSONDecoder()
                
                print(String(data: data!, encoding: .utf8)!)
                
                do {
                    let result = try decoder.decode(Offer.self, from: data!)
                    self.offers = result.offerData
                    
                    DispatchQueue.main.async {
                        self.offfersCollectionView.reloadData()
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }
            
            
        }
        datatask.resume()
    }
    
    func getneqrbyResponse() {

        let parameters = ["lat" : "11.0168", "lng" : "76.9558"]
        let jsonString = jsonToString(json: parameters)
        let postData = jsonString.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://161.35.142.163/eatzilla_v2/api/get_nearby_restaurant?lng=76.9558&lat=11.0168")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
//        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else{ return}

            let results = try! JSONDecoder().decode(Banners.self, from: data)
            self.nearby = results.restaurants

              DispatchQueue.main.async {
                  self.nearbyCollectionView.reloadData()
              }

        }

        task.resume()

    }
    
    func offerApi(){
        
    }
    
    
    private func registerCells(){
        
        offfersCollectionView.register(UINib(nibName: offersCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: offersCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: PopularCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        nearbyCollectionView.register(UINib(nibName: NearByCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: NearByCollectionViewCell.identifier)
    }
   
    @IBAction func didTapMenu(_ sender: Any) {
        present(menu!, animated: true)
    }
    
    
    func addChildController() {
        
        
    }
    
    func didSelectItems(named: SideMenuItem) {
        menu?.dismiss(animated: true, completion: nil)
    }

}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    switch collectionView {
    case offfersCollectionView:
        return offers.count
    case  popularCollectionView:
        return populars.count
    case nearbyCollectionView:
        return nearby.count
    default:
        return 0
    }
    
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    switch collectionView {
    case offfersCollectionView:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: offersCollectionViewCell.identifier, for: indexPath) as! offersCollectionViewCell
        cell.setup(offers: offers[indexPath.row])
        cell.selectedBackgroundView = .none
        return cell
    case  popularCollectionView:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as! PopularCollectionViewCell
        cell.setup(dish: populars[indexPath.row])
        cell.selectedBackgroundView = .none
        return cell
    case nearbyCollectionView:
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NearByCollectionViewCell.identifier, for: indexPath) as! NearByCollectionViewCell
        cell.setup(restaurants: nearby[indexPath.row])
        cell.selectedBackgroundView = .none
        return cell
    default:
        return UICollectionViewCell()
    }
      
}
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let viewController = storyBoard.instantiateViewController(
                    withIdentifier: "DetailFoodListViewController") as?
        DetailFoodListViewController else { return }
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }

}



