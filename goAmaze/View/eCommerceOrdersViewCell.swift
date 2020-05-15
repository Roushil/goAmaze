//
//  eCommerceOrdersViewCell.swift
//  goAmaze
//
//  Created by Roushil singla on 5/15/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

class eCommerceOrdersViewCell: UITableViewCell {

    @IBOutlet weak var orderImage: UIImageView!
    @IBOutlet weak var orderId: UILabel!
    @IBOutlet weak var orderName: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    
    var order: OrderData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func updateCellToItems(item: OrderData){
        
        self.order = item
        
        if let itemId = order?.orderId{
            self.orderId.text = "Order Id #\(itemId)"
        }
        
        if let itemName = order?.orderName{
            self.orderName.text = itemName
        }
        
        if let itemPrice = order?.orderPrice{
            self.orderPrice.text = "₹\(itemPrice)"
        }
        
        if let imageURL = order?.orderImageURL{
            self.orderImage.loadImageUsingCache(image: imageURL)
        }
    }
    
}
