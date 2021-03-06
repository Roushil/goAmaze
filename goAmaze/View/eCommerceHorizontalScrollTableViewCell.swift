//
//  eCommerceHorizontalScrollTableViewCell.swift
//  eComm_Application
//
//  Created by Manikanta on 10/04/20.
//  Copyright © 2020 Manikanta. All rights reserved.
//

import UIKit


class eCommerceHorizontalScrollTableViewCell: UITableViewCell {
    
    var productsModel: [Product]?
    var productDetail: ((Product) -> Void)!
    
    @IBOutlet weak var defaultcollectionView: UICollectionView!
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        defaultcollectionView.register(UINib(nibName: "eCommerceCollectionViewCellItem", bundle: nil), forCellWithReuseIdentifier: "eCommerceCollectionCellIdentifierItem")
        defaultcollectionView.showsHorizontalScrollIndicator = false
    }
    
    
    func setupItemsinCells(itemsModel: Content) {
        nameLabel.text = itemsModel.name
        productsModel = itemsModel.products
    }
    
}

extension eCommerceHorizontalScrollTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsModel!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eCommerceCollectionCellIdentifierItem", for: indexPath) as! eCommerceCollectionViewCellItem
        
        DispatchQueue(label: "com.ecommerce.configCell").async {
            DispatchQueue.main.async {
                cell.setupItemsInsideCells(itemModels: self.productsModel![indexPath.row])
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let products = productsModel else { return }
        productDetail(products[indexPath.row])
    }
}


extension eCommerceHorizontalScrollTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = 144
        let itemHeight = 270
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    override var accessibilityTraits: UIAccessibilityTraits {
        get {
            return UIAccessibilityTraits.none
        }
        set {}
    }
}
