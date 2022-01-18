//
//  NearbyModel.swift
//  Task
//
//  Created by vignesh kumar c on 11/01/22.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let banners = try? newJSONDecoder().decode(Banners.self, from: jsonData)

import Foundation

// MARK: - Banners
struct Banners: Codable {
    let status: Bool
    let restaurants: [Restaurant]
}

// MARK: - Restaurant
struct Restaurant: Codable {
    let id: Int
    let name: String
    let image: String
    let discount: String
    let rating, isOpen, isBusy: Int
    let cuisines: [Cuisine]
    let travelTime, price, discountType, targetAmount: String
    let offerAmount: String
    let isFoodOfferExist, isFavourite: Int
    let deliveryType, address: String
    let minOrderValue, restaurantDeliveryCharge, restaurantDeliveryChargeIos: Int

    enum CodingKeys: String, CodingKey {
        case id, name, image, discount, rating
        case isOpen = "is_open"
        case isBusy = "is_busy"
        case cuisines
        case travelTime = "travel_time"
        case price
        case discountType = "discount_type"
        case targetAmount = "target_amount"
        case offerAmount = "offer_amount"
        case isFoodOfferExist = "is_food_offer_exist"
        case isFavourite = "is_favourite"
        case deliveryType = "delivery_type"
        case address
        case minOrderValue = "min_order_value"
        case restaurantDeliveryCharge = "restaurant_delivery_charge"
        case restaurantDeliveryChargeIos = "restaurant_delivery_charge_ios"
    }
}

// MARK: - Cuisine
struct Cuisine: Codable {
    let name: String
}

