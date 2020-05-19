//
//  OrderListViewController.swift
//  goAmaze
//
//  Created by Roushil singla on 5/15/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

class OrderListViewController: UIViewController {

    @IBOutlet weak var orderListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orderListTableView.register(UINib(nibName: "eCommerceOrdersViewCell", bundle: nil), forCellReuseIdentifier: "ordersViewCell")
    }
}

extension OrderListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContentViewModel.shared.orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = orderListTableView.dequeueReusableCell(withIdentifier: "ordersViewCell", for: indexPath) as! eCommerceOrdersViewCell
        cell.updateCellToItems(item: ContentViewModel.shared.orderList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}

extension OrderListViewController{
    static func shareInstance() -> OrderListViewController{
        OrderListViewController.instantiateFromStoryboard()
    }
}
