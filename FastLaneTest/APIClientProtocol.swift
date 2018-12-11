//
//  APIClientProtocol.swift
//  FastLaneTest
//
//  Created by 周彥宏 on 2018/12/11.
//  Copyright © 2018 周彥宏. All rights reserved.
//

import Foundation

protocol APIClientProtocol {
    
    func login(_ userName: String, password: String, completionHandler: @escaping ([String: Any]?, Error?) -> Void);
    
    func requestReviews(_ completionHandler: @escaping ([String: Any]?, Error?) -> Void);
}


