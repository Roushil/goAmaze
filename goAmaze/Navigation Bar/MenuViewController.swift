//
//  MenuViewController.swift
//  testSampleProducts
//
//  Created by Manikanta on 09/04/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case profile
    case home
    case orders
    case cart
    case notifications
    case ratings
    case about
    case signOut
}

class MenuViewController: UITableViewController {
    
    @IBOutlet weak var headerName: UILabel!
    var didMenuTapped: ((MenuType) -> Void)?
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerName.text = "Hello \(userName ?? "")"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let menuType = MenuType(rawValue: indexPath.row) else {
            return
        }
        dismiss(animated: true, completion: { [weak self] in
            self?.didMenuTapped?(menuType)
        })
    }
}

extension MenuViewController{
    static func shareInstance() -> MenuViewController{
        MenuViewController.instantiateFromStoryboard()
    }
}
