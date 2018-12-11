//
//  UserProfile.swift
//  FastLaneTest
//
//  Created by 周彥宏 on 2018/12/11.
//  Copyright © 2018 周彥宏. All rights reserved.
//

import Foundation


class UserProfile: Decodable {
    
    enum UserProfileKeys: String, CodingKey {
        case profile = "profile"
        case userName = "userName"
        case description = "description"
        case followers = "followers"
        case preferences = "preferences"
    }
    
    private let userName: String
    private let description: String
    private let followers: Int
    private let restaurantPreferences: [String]
    
    
    init(_ userName: String, description: String, followers: Int, restaurantPreferences: [String]) {
        self.userName = userName;
        self.description = description;
        self.followers = followers;
        self.restaurantPreferences = restaurantPreferences
    }
    
    required public convenience init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: UserProfileKeys.self);
        let profile = try container.nestedContainer(keyedBy: UserProfileKeys.self, forKey: .profile);
        
        let userName = try profile.decode(String.self, forKey: .userName);
        let followers = try profile.decode(Int.self, forKey: .followers);
        let description = try profile.decode(String.self, forKey: .description);
        let preferences = try profile.decode([String].self, forKey: .preferences);
        
        self.init(userName, description: description, followers: followers, restaurantPreferences: preferences);
    }
}
