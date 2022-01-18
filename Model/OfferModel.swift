//
//  OfferModel.swift
//  Task
//
//  Created by vignesh kumar c on 13/01/22.
//
import Foundation

// MARK: - Offer
struct Offer: Codable {
    let status: Bool
    let offerData: [Datum]
    let baseURL: String

    enum CodingKeys: String, CodingKey {
        case status
        case baseURL = "base_url"
        case offerData = "data"
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id, restaurantID: Int
    let image, image1: String
    let title, datumDescription, position: String?
    let status, isSuffle: Int
    let createdAt, updatedAt, restaurantName: String
    let isOpen: Int

    enum CodingKeys: String, CodingKey {
        case id
        case restaurantID = "restaurant_id"
        case image, image1, title
        case datumDescription = "description"
        case position, status
        case isSuffle = "is_suffle"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case restaurantName = "restaurant_name"
        case isOpen = "is_open"
    }
}
