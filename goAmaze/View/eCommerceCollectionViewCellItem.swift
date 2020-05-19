//
//  eCommerceCollectionViewCellItem.swift
//  eComm_Application
//
//  Created by Manikanta on 10/04/20.
//  Copyright © 2020 Manikanta. All rights reserved.
//

import UIKit

class eCommerceCollectionViewCellItem: UICollectionViewCell {
    
    @IBOutlet weak var imageViewCell: UIImageView! {
        didSet {
            
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            
        }
    }
    
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            
        }
    }
    
    @IBOutlet weak var typeLabel: UILabel! {
        didSet {
            
        }
    }

    func setupItemsInsideCells(itemModels: Product) {
        nameLabel.text = itemModels.name
        priceLabel.text = "Rs \(itemModels.price)"
        typeLabel.text = itemModels.type
        imageViewCell.loadImageUsingCache(image: itemModels.imageURL)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
