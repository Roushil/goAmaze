//
//  eCommerceAddToCartTableViewCell.swift
//  eComm_Application
//
//  Created by Manikanta on 14/05/20.
//  Copyright © 2020 Manikanta. All rights reserved.
//

import UIKit

class eCommerceAddToCartTableViewCell: UITableViewCell {
    
    var cart_Details: CartData?
    
    @IBOutlet weak var leftImageView: UIImageView!{
        didSet {
            
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            
        }
    }
    
    @IBOutlet weak var priceLable: UILabel! {
        didSet {
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    func updateItemsToCell(itemsList: CartData) {
        
        self.cart_Details = itemsList
        
        if let product_Name = self.cart_Details?.item_Name {
            nameLabel.text = product_Name
        }
        
        if let product_Price = self.cart_Details?.item_Price {
            priceLable.text = "₹\(product_Price)"
        }
        
        if let product_Image = self.cart_Details?.item_URL {
            let imageUrl = URL(string: product_Image)
            let imageData = try! Data(contentsOf: imageUrl!)
            let thumImage = UIImage(data: imageData)
            leftImageView.image = thumImage
        }
        
    }
}
