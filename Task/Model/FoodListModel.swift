//
//  FoodListModel.swift
//  Task
//
//  Created by vignesh kumar c on 12/01/22.
//

import Foundation

// MARK: - FoodsItem
struct FoodsItem: Codable {
    let status: Bool
    let foodList: [FoodList]
    let restaurantDetail: RestaurantDetail

    enum CodingKeys: String, CodingKey {
        case status
        case foodList = "food_list"
        case restaurantDetail = "restaurant_detail"
    }
}

// MARK: - FoodList
struct FoodList: Codable {
    let categoryID, categorySort: Int
    let categoryName: String
    let allItems: [Item]
    let minOrderValue: Int

    enum CodingKeys: String, CodingKey {
        case categoryID = "category_id"
        case categorySort = "category_sort"
        case categoryName = "category_name"
        case allItems = "items"
        case minOrderValue = "min_order_value"
    }
}

// MARK: - Item
struct Item: Codable {
    let foodID: Int
    let name: String?
    let image: String?
    let isVeg: Int
    let price: Double
    let itemDescription: String
    let categoryID: Int
    let choiceCategory: [ChoiceCategory]
    let itemCount: Int
    let foodOffer: String?
    let foodPercentageOffer, discountType, targetAmount, offerAmount: Int
    let itemTax: Int
    let addOns, foodQuantity: [String]

    enum CodingKeys: String, CodingKey {
        case foodID = "food_id"
        case name, image
        case isVeg = "is_veg"
        case price
        case itemDescription = "description"
        case categoryID = "category_id"
        case choiceCategory = "choice_category"
        case itemCount = "item_count"
        case foodOffer = "food_offer"
        case foodPercentageOffer = "food_percentage_offer"
        case discountType = "discount_type"
        case targetAmount = "target_amount"
        case offerAmount = "offer_amount"
        case itemTax = "item_tax"
        case addOns = "add_ons"
        case foodQuantity = "food_quantity"
    }
}

// MARK: - ChoiceCategory
struct ChoiceCategory: Codable {
    let id, restaurantID, foodID: Int
    let name: Name
    let min, max, createdAt, updatedAt: String
    let parentChoiceCategoryID: Int
    let choice: [Choice]

    enum CodingKeys: String, CodingKey {
        case id
        case restaurantID = "restaurant_id"
        case foodID = "food_id"
        case name, min, max
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case parentChoiceCategoryID = "parent_choice_category_id"
        case choice
    }
}

// MARK: - Choice
struct Choice: Codable {
    let id, choiceCategoryID: Int
    let name: String
    let price: Double
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case choiceCategoryID = "choice_category_id"
        case name, price
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

enum Name: String, Codable {
    case addCheese = "Add Cheese"
    case addExtraCheese = "Add Extra Cheese"
    case addExtraMeatCHicken = "Add Extra Meat/CHicken"
    case addExtraMeatChicken = "Add Extra Meat/Chicken"
    case addExtraVegetable = "Add Extra Vegetable"
    case addExtraVegetables = "Add Extra Vegetables"
    case addOn = "Add On"
    case crust = "Crust"
    case extraCheese = "Extra Cheese"
    case extraVegetables = "Extra Vegetables"
    case numberOfPieces = "Number of Pieces"
    case size = "Size"
    case yourChoiceOf = "Your Choice of"
    case yourChoiceOfSauce = "Your Choice of Sauce"
}

// MARK: - RestaurantDetail
struct RestaurantDetail: Codable {
    let restaurantName: String
    let image: String
    let address, discountType, targetAmount, offerAmount: String
    let tax, minOrderValue: Int

    enum CodingKeys: String, CodingKey {
        case restaurantName = "restaurant_name"
        case image, address
        case discountType = "discount_type"
        case targetAmount = "target_amount"
        case offerAmount = "offer_amount"
        case tax
        case minOrderValue = "min_order_value"
    }
}

