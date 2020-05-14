//
//  ProductViewController.swift
//  goAmaze
//
//  Created by Roushil singla on 5/13/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productType: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    var name: String!
    var type: String!
    var price: String!
    var imageURL: String!
    
    var product: Product!{
        didSet{
            name = product.name
            type = product.type
            price = product.price
            imageURL = product.imageURL
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rupee = "\u{20B9}"
        productName.text = name
        productType.text = type
        productPrice.text = "\(rupee)\(price ?? "")"
        productImage.loadImageUsingCache(image: imageURL)
    }
    @IBAction func buyProductTapped(_ sender: UIButton) {
        
        let orderVc = PlaceOrderViewController.shareInstance()
        navigationController?.pushViewController(orderVc, animated: true)
    }
}

extension ProductViewController{
    static func shareInstance() -> ProductViewController{
        ProductViewController.instantiateFromStoryboard()
    }
}
