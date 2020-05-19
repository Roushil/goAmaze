//
//  Legal&AboutController.swift
//  goAmaze
//
//  Created by Roushil singla on 5/13/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var conditionsOfUse: UILabel!
    @IBOutlet weak var limitations: UILabel!
    @IBOutlet weak var termsAndConditions: UILabel!
    @IBOutlet weak var privacy: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView(){
        view.backgroundColor = .lightGray
        conditionsOfUse.underline()
        limitations.underline()
        termsAndConditions.underline()
        privacy.underline()
    }

}

extension AboutViewController{
    static func shareInstance() -> AboutViewController{
        AboutViewController.instantiateFromStoryboard()
    }
}
