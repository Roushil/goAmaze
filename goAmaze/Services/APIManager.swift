//
//  APIManager.swift
//  testSampleProducts
//
//  Created by Roushil singla on 4/7/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation
import UIKit

class APIManager:NSObject{
    class func getProducts(completion: @escaping (_ gotData: Bool) -> Void){
        
        if let path = Bundle.main.url(forResource: "Product_List", withExtension: "json") {
            do{
                let data = try Data(contentsOf: path)
                let result = try JSONDecoder().decode(Object.self, from: data)
                ContentViewModel.shared.productContent = result.content
                completion(true)
            }catch{
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
}
