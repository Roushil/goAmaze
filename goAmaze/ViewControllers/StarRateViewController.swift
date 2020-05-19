//
//  StarRateViewController.swift
//  goAmaze
//
//  Created by Roushil singla on 5/15/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit
import Cosmos

class StarRateViewController: UIViewController {

    @IBOutlet weak var starView: UIView!
    @IBOutlet weak var rateValue: UILabel!
    
    lazy var cosmosView: CosmosView = {
        var view = CosmosView()
        let filledStar = UIImage(named: "FilledStar")
        view.settings.filledImage  = filledStar
        view.settings.emptyImage  = UIImage(named: "EmptyStar")
        view.settings.starSize = 60
        view.settings.starMargin = 10
        view.settings.fillMode = .half
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStarView()
    }
    
    @IBAction func doneRatingTapped(_ sender: Any) {
            
        dismiss(animated: true, completion: nil)
    }
    
    func setStarView(){
        
        starView.addSubview(cosmosView)
        
        starView.layer.borderWidth = 2.0
        starView.layer.borderColor = UIColor.black.cgColor
        
        cosmosView.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
        cosmosView.centerXAnchor.constraint(equalTo: starView.centerXAnchor).isActive = true
        
        cosmosView.didTouchCosmos = { [weak self] ratings in
            guard let _self = self else { return }
            _self.rateValue.text = "\(ratings) out of 5"
        }
    }
}

extension StarRateViewController{
    static func shareInstance() -> StarRateViewController{
        StarRateViewController.instantiateFromStoryboard()
    }
}
