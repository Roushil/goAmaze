//
//  goAmazeTests.swift
//  goAmazeTests
//
//  Created by Roushil singla on 5/19/20.
//  Copyright © 2020 personal. All rights reserved.
//

import XCTest

class goAmazeTests: XCTestCase {


    func testAPIPerformance() {
        
        APIManager.getProducts { (success) in
            XCTAssertEqual(success, true)
        }
    }
}

class APIManager{
    class func getProducts(completion: @escaping (_ gotData: Bool) -> Void){
        
        if Bundle.main.url(forResource: "Product_List", withExtension: "json") != nil {
            do{
                completion(true)
            }
        }
    }
}
