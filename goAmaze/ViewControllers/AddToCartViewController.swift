//
//  AddToCartViewController.swift
//  goAmaze
//
//  Created by Manikanta on 14/05/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit


class AddToCartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var priceLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView.register(UINib(nibName: "eCommerceAddToCartTableViewCell", bundle: nil), forCellReuseIdentifier: "addToCartCell")
        
        totalPriceCalculation()
    }
    
    
    func totalPriceCalculation() {
        var total_Price: Int = 0
        
        for product_price in ContentViewModel.shared.cartList {
            total_Price += Int(product_price.item_Price!)!
        }
        
        self.priceLable.text = "₹\(total_Price)"
        
        if total_Price == 0 {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func placeORder() {
        
        let vc = PlaceOrderViewController.shareInstance()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContentViewModel.shared.cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "addToCartCell") as! eCommerceAddToCartTableViewCell
        cell.updateItemsToCell(itemsList: ContentViewModel.shared.cartList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ContentViewModel.shared.cartList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            totalPriceCalculation()
        }
    }
}
