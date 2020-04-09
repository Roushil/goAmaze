//
//  Objects.swift
//  testSampleProducts
//
//  Created by Roushil singla on 4/7/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation

struct Object: Decodable {
    var code: String
    var content: [Content]
}
