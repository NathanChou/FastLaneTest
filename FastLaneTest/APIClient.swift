//
//  APIClient.swift
//  FastLaneTest
//
//  Created by 周彥宏 on 2018/12/11.
//  Copyright © 2018 周彥宏. All rights reserved.
//

import Foundation



class APIClient {
    
    enum APIError: Error {
        case serviceError
    }
    
    private func execute(_ urlRequest: URLRequest, complectionHandler: @escaping ([String: Any]?, Error?) -> Void) {
        
        let urlSession = URLSession.shared;
        
        let dataTask = urlSession.dataTask(with: urlRequest) { (data, response, error) in
            
            guard let responseStatus = response as? HTTPURLResponse, responseStatus.statusCode == 200 else {
                complectionHandler(nil, APIError.serviceError)
                return
            }
            
            guard let data = data, error == nil else {
                complectionHandler(nil, APIError.serviceError)
                return
            }
            
            do {
                guard let jsonDic = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    complectionHandler(nil, APIError.serviceError)
                    return
                }
                
                complectionHandler(jsonDic, nil);
                
            } catch {
                complectionHandler(nil, error);
            }
        }
        
        dataTask.resume();
    }
    
}


extension APIClient: APIClientProtocol {
    
    func login(_ userName: String, password: String, completionHandler: @escaping ([String : Any]?, Error?) -> Void) {
        
        guard let url = URL(string: "http://localhost:8181/api/login") else {
            completionHandler(nil, APIError.serviceError)
            return
        }
        
        var urlRequest = URLRequest(url: url);
        urlRequest.httpMethod = "POST";
        urlRequest.addValue(password, forHTTPHeaderField: "pasword");
        urlRequest.addValue(userName, forHTTPHeaderField: "userName");
        
        execute(urlRequest, complectionHandler: completionHandler);
    }
    
    func requestReviews(_ completionHandler: @escaping ([String : Any]?, Error?) -> Void) {
        
        guard let url = URL(string: "http://localhost:8181/api/reviews") else {
            completionHandler(nil, APIError.serviceError)
            return
        }
        
        var urlRequest = URLRequest(url: url);
        urlRequest.httpMethod = "GET"
        
        execute(urlRequest, complectionHandler: completionHandler);
    }
    
}
