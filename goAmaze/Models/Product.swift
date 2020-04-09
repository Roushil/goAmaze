//
//  Product.swift
//  testSampleProducts
//
//  Created by Roushil singla on 4/7/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation
import UIKit

struct Product: Decodable {
    var name:String
    var price: String
    var imageURL: String
    var type: String
}
