//
//  Content.swift
//  testSampleProducts
//
//  Created by Roushil singla on 4/7/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation
import UIKit

struct Content: Decodable{
    
    var sectionType: String?
    var name: String?
    var bannerImage: String?
    var firstImage: String?
    var secondImage: String?
    var products: [Product]?
}
