//
//  FastLaneTestTests.swift
//  FastLaneTestTests
//
//  Created by 周彥宏 on 2018/12/5.
//  Copyright © 2018 周彥宏. All rights reserved.
//

@testable import FastLaneTest
import XCTest

class FastLaneTestTests: XCTestCase {
    
    let apiClient = MockAPIClient();
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testLoginResponse() {
        
        let expectation = self.expectation(description: "Login Response Parse Expectation")
        
        apiClient.login("foodLover", password: "foodForever123$") { (json, error) in
            
            XCTAssertNil(error);
            
            guard let json = json else {
                return
            }
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: json, options: []);
                let userProfile = try JSONDecoder().decode(UserProfile.self, from: jsonData);
                XCTAssertNotNil(userProfile);
                expectation.fulfill();
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
        
        self.waitForExpectations(timeout: 10.0, handler: nil);
    }
    
    func testRetrieveReviews() {
        
        let expectation = self.expectation(description: "Login Response Parse Expectation");
        
        apiClient.requestReviews { (json, error) in
            
            XCTAssertNil(error);
            
            guard let reviews = json else {
                XCTFail();
                return;
            }
            
            do {
                guard let reviewsCollection = reviews["reviews"] else {
                    XCTFail();
                    return;
                }
                
                let jsonData = try JSONSerialization.data(withJSONObject: reviewsCollection, options: []);
                let reviews = try JSONDecoder().decode([Review].self, from: jsonData);
                
                XCTAssertNotNil(reviews);
                
                expectation.fulfill();
                
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
        
        self.waitForExpectations(timeout: 10.0, handler: nil);
    }
    
    
    

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
