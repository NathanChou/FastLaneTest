//
//  MockAPIClient.swift
//  FastLaneTestTests
//
//  Created by 周彥宏 on 2018/12/11.
//  Copyright © 2018 周彥宏. All rights reserved.
//

import Foundation

@testable import FastLaneTest


class MockAPIClient {
    
    var shouldReturnError = false
    var loginWasCalled = false
    var requestReviewsWasCalled = false
    
    enum MockServiceError: Error {
        case login
        case requestReviews
    }
    
    func reset() {
        shouldReturnError = false;
        loginWasCalled = false;
        requestReviewsWasCalled = false;
    }
    
    
    convenience init() {
        self.init(false);
    }
    
    
    init(_ shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError;
    }
    
    
    let mockLoginResponse: [String: Any] = [
        "profile": [
            "userName": "SuperFoodie",
            "description": "I travel far and wide for the best food I can find.",
            "followers": 108,
            "preferences": ["japanese", "mexican", "thai", "italian", "german", "korean"]
        ]
    ]
    
    
    let mockReviewsResponse: [String: Any] = [
        "reviews": [
            [
                "restaurantName": "Siam Thai Cuisine",
                "reviewTitle": "Authentic!",
                "rating": 4.0,
                "reviewDescription": "Very authentic Thai food would definitely go back :)"
            ],
            [
                "restaurantName": "Seito Sushi",
                "reviewTitle": "Went out to a really good japanese restaurant",
                "rating": 4.5,
                "reviewDescription": "This restaurant was really good the food was delicious and the staff really friendly."
            ]
        ]
    ]
    
}

extension MockAPIClient: APIClientProtocol {
    
    func login(_ userName: String, password: String, completionHandler: @escaping ([String : Any]?, Error?) -> Void) {
        loginWasCalled = true
        
        if shouldReturnError {
            completionHandler(nil, MockServiceError.login);
        } else {
            completionHandler(mockLoginResponse, nil);
        }
    }
    
    func requestReviews(_ completionHandler: @escaping ([String : Any]?, Error?) -> Void) {
        requestReviewsWasCalled = true;
        
        if shouldReturnError {
            completionHandler(nil, MockServiceError.requestReviews);
        } else {
            completionHandler(mockReviewsResponse, nil);
        }
    }
    
    
}
