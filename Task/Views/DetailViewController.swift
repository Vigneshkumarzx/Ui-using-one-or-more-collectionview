//
//  DetailViewController.swift
//  Task
//
//  Created by vignesh kumar c on 12/01/22.
//

import UIKit
import Kingfisher

class DetailFoodListViewController: UIViewController {
    
    let baseUrl = "https://dawar.nyc3.digitaloceanspaces.com/"
    
    var foodlist1 = [FoodList]()
    var restaurant: Restaurant?
    var imagelist = [Item]()
  
    @IBOutlet weak var fullImageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getResponse()
        self.fullImageView.kf.setImage(with: restaurant?.image.asUrl)
        self.title = restaurant?.name
        tableView.register(UINib(nibName: "FoodListTableViewCell", bundle: nil), forCellReuseIdentifier: "FoodListTableViewCell")
//        tableView.register(FoodListTableViewCell.self, forCellReuseIdentifier: "FoodListTableViewCell")

    }
    
    
   func image(rest: Restaurant){
        
       
       
    }
    
    func jsonToString(json: [String : Any]) -> String{
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
    
    func getResponse(){
        let parameters = ["device_type" : "ios",  "restaurant_id" : 119, "is_veg" : 0] as [String : Any]
        
            let jsonString = jsonToString(json: parameters)
            
            let postData = jsonString.data(using: .utf8)

            var request = URLRequest(url: URL(string: "http://161.35.142.163/eatzilla_v2/api/get_food_list")!,timeoutInterval: Double.infinity)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            request.httpMethod = "POST"
            request.httpBody = postData

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else{ return}
                
                print(String(data: data, encoding: .utf8)!)
                
                let result = try! JSONDecoder().decode(FoodsItem.self, from: data)
                self.foodlist1 = result.foodList
                
                print(result)

                DispatchQueue.main.async  {
                    self.tableView.reloadData()
                }
                
            }

            task.resume()
        }


}

extension DetailFoodListViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodlist1.first?.allItems.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodListTableViewCell", for: indexPath) as! FoodListTableViewCell
        
        cell.setup(foodList: foodlist1.first!.allItems[indexPath.row])
        fullImageView.kf.setImage(with:(baseUrl + (imagelist.first?.image ?? "")).asUrl)
         
        cell.selectionStyle = .none
        return cell
    }


    
    
    
}
