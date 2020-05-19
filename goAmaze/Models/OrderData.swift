//
//  OrderData.swift
//  goAmaze
//
//  Created by Roushil singla on 5/15/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation

class OrderData {
    
    var orderId: Int?
    var orderName: String?
    var orderPrice: String?
    var orderImageURL: String?
    var orderType: String?
    
    init(orderId: Int, orderName: String, orderPrice: String, orderImageUrl: String, orderType: String){
        
        self.orderId = orderId
        self.orderName = orderName
        self.orderPrice = orderPrice
        self.orderImageURL = orderImageUrl
        self.orderType = orderType
    }
}
