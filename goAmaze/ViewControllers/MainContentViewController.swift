//
//  MainContentViewController.swift
//  goAmaze
//
//  Created by Roushil singla on 4/9/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn
import SideMenu

class MainContentViewController: UIViewController {
    
    var contentModel: [Content]?
    var contentTableView: UITableView!
    var menu: SideMenuNavigationController? = nil
    var profileName: String?
    let cartButton = SSBadgeButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMenuItems()
        fetchJSONData()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupCartButton()
        
    }
    
    
    @IBAction func didSelectedMenuItem(_ sender: Any) {
        present(menu!, animated: true, completion: nil)
    }
    
    func setupCartButton() {
          cartButton.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
          cartButton.setImage(UIImage(named: "Cart")?.withRenderingMode(.alwaysTemplate), for: .normal)
          cartButton.badgeEdgeInsets = UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 0)
          cartButton.tintColor = .black
          cartButton.addTarget(self, action: #selector(moveToCartController), for: .touchUpInside)
          cartButton.clipsToBounds = true
          cartButton.badge = "\(ContentViewModel.shared.cartList.count)"
    
          self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cartButton)
      }
    
    @objc func moveToCartController() {
        
        if ContentViewModel.shared.cartList.count == 0 {
            
            showAlert(title: "Your Cart is Empty", message: "Add items to it now", actionString: "Thank You")
        }
        else {
            
            let cartController = self.storyboard?.instantiateViewController(identifier: "AddToCartViewController") as! AddToCartViewController
            self.navigationController?.pushViewController(cartController, animated: true)
        }
    }
    
    func moveToOrderList(){
        
        let orderVC = OrderListViewController.shareInstance()
        navigationController?.pushViewController(orderVC, animated: true)
    }
    
    

    func setMenuItems(){
        
        let menuVC = self.storyboard?.instantiateViewController(identifier: "MenuViewController") as! MenuViewController
        menuVC.userName = profileName
        menu = SideMenuNavigationController(rootViewController: menuVC)
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: true)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        menuVC.didMenuTapped = { menuType in
            self.transitionToMainView(menuType)
        }
    }

    func signOutUser(){
        
        GIDSignIn.sharedInstance().signOut()
        print("Successfully Signed Out")
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupTableView() {
        
        contentTableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
        contentTableView.dataSource = self
        contentTableView.delegate = self
        contentTableView.separatorStyle = .none
        contentTableView.allowsSelection = false
        contentTableView.showsVerticalScrollIndicator = false
        self.view.addSubview(contentTableView)
    }
    
    func registerNib() {
        contentTableView.register(UINib(nibName: "eCommerceHorizontalScrollTableViewCell", bundle: nil), forCellReuseIdentifier: "horizontalScrollViewIdentifier")
        contentTableView.register(UINib(nibName: "BannerTableViewCell", bundle: nil), forCellReuseIdentifier: "BannerTableViewCell")
        contentTableView.register(UINib(nibName: "SplitBannerCell", bundle: nil), forCellReuseIdentifier: "SplitBannerCell")
    }
    
    func fetchJSONData(){
        APIManager.getProducts { (success) in
            if success {
                self.contentModel = ContentViewModel.shared.productContent
                
                DispatchQueue.main.async {
                    self.setupTableView()
                    self.registerNib()
                }
            }
        }
    }
    

    func showAlert(title: String, message: String, actionString: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionButton = UIAlertAction(title: actionString, style: .default, handler: nil)
        alert.addAction(actionButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func showAbout(){
        let vc = AboutViewController.shareInstance()
        present(vc, animated: true, completion: nil)
    }
    
    func transitionToMainView(_ menuType: MenuType) {
    
        switch menuType {
        case .profile: break
        case .home: break
        case .orders: moveToOrderList()
        case .cart: moveToCartController()
        case .notifications: showAlert(title: "Not Available",
                                       message: "Your Notification is not available at the moment. Please try again later",
                                       actionString: "OK")
        case .ratings: break
        case .about: showAbout()
        case .signOut: signOutUser()
        }
    }
}

extension MainContentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentModel!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let content = contentModel?[indexPath.row] else { return UITableViewCell()}
        switch indexPath.row {
            
        case 0...3:
            let cell = contentTableView.dequeueReusableCell(withIdentifier: "horizontalScrollViewIdentifier", for: indexPath) as! eCommerceHorizontalScrollTableViewCell
            cell.setupItemsinCells(itemsModel: content)
            
            cell.productDetail = { [weak self] (product) in
                
                guard let _self = self else { return }
                let vc = ProductViewController.shareInstance()
                vc.product = product
                _self.navigationController?.pushViewController(vc, animated: true)
            }
            
            
            return cell
        case 4:
            let cell = contentTableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as! BannerTableViewCell
            cell.bannerImage.loadImageUsingCache(image: content.bannerImage ?? "")
            return cell
        case 5:
            let cell = contentTableView.dequeueReusableCell(withIdentifier: "SplitBannerCell", for: indexPath) as! SplitBannerCell
            cell.firstImage.loadImageUsingCache(image: content.firstImage ?? "")
            cell.secondImage.loadImageUsingCache(image: content.secondImage ?? "")
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
}


extension MainContentViewController{
    static func shareInstance() -> MainContentViewController{
        MainContentViewController.instantiateFromStoryboard()
    }
}
