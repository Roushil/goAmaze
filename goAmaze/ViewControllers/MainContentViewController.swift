//
//  MainContentViewController.swift
//  goAmaze
//
//  Created by Roushil singla on 4/9/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation
import UIKit

class MainContentViewController: UIViewController {
    
    var contentModel: [Content]?
    var contentTableView: UITableView!
    fileprivate let kCommerceListTableViewHeight: CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchJSONData()
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
}


extension MainContentViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kCommerceListTableViewHeight
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return kCommerceListTableViewHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentModel!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let content = contentModel?[indexPath.row] else { return UITableViewCell()}
        switch indexPath.row {
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
