//
//  Review.swift
//  FastLaneTest
//
//  Created by 周彥宏 on 2018/12/11.
//  Copyright © 2018 周彥宏. All rights reserved.
//

import Foundation



class Review: Decodable {
    
    enum ReviewKeys: String, CodingKey {
        case reviews = "reviews"
        case restaurantName = "restaurantName"
        case reviewTitle = "reviewTitle"
        case rating = "rating"
        case reviewDescription = "reviewDescription"
    }
    
    private let restaurantName: String
    private let reviewTitle: String
    private let rating: Float
    private let reviewDescription: String
    
    
    init(_ restaurantName: String, reviewTitle: String, rating: Float, reviewDescription: String) {
        self.restaurantName = restaurantName;
        self.reviewTitle = reviewTitle;
        self.rating = rating;
        self.reviewDescription = reviewDescription
    }
    
    required public convenience init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: ReviewKeys.self);
        
        
        let restaurantName = try container.decode(String.self, forKey: .restaurantName);
        let reviewTitle = try container.decode(String.self, forKey: .reviewTitle);
        let rating = try container.decode(Float.self, forKey: .rating);
        let reviewDescription = try container.decode(String.self, forKey: .reviewDescription);
        
        self.init(restaurantName, reviewTitle: reviewTitle, rating: rating, reviewDescription: reviewDescription);
    }
}
