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
        priceLabel.text = itemModels.price
        typeLabel.text = itemModels.type
        
        let imageUrl = URL(string: itemModels.imageURL)!
        let imageData = try! Data(contentsOf: imageUrl)
        let thumImage = UIImage(data: imageData)
        imageViewCell.image = thumImage
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
