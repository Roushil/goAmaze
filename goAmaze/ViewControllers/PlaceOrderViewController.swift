//
//  PlaceOrderViewController.swift
//  goAmaze
//
//  Created by Roushil singla on 5/14/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var address1: UITextField!
    @IBOutlet weak var address2: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var mobNumber: UITextField!
    @IBOutlet weak var postalCode: UITextField!
    @IBOutlet weak var cardName: UITextField!
    @IBOutlet weak var cardNumber: UITextField!
    @IBOutlet weak var cardExpiryDate: UITextField!
    @IBOutlet weak var cardCVV: UITextField!
    @IBOutlet weak var orderProduct: UIButton!
    @IBOutlet weak var productPrice: UILabel!
    
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }

    @IBAction func placeOrderTapped(_ sender: UIButton) {
        
        if (userName.text!.isEmpty || address1.text!.isEmpty || address2.text!.isEmpty || city.text!.isEmpty || state.text!.isEmpty || mobNumber.text!.isEmpty || postalCode.text!.isEmpty || cardName.text!.isEmpty || cardNumber.text!.isEmpty || cardExpiryDate.text!.isEmpty || cardCVV.text!.isEmpty){

            orderProduct.shake()
            showAlert()
        }else{
            placeOrder()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setDelegates(){
        userName.delegate = self
        address1.delegate = self
        address2.delegate = self
        city.delegate = self
        state.delegate = self
        mobNumber.delegate = self
        postalCode.delegate = self
        cardName.delegate = self
        cardNumber.delegate = self
        cardExpiryDate.delegate = self
        cardCVV.delegate = self
        
        productPrice.text = "₹\(product.price)"
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Invalid Data", message: "It is mandatory to fill all the details", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func placeOrder(){
        
        let orderNumber = Int.random(in: 10000...20000)
        let alert = UIAlertController(title: "Order Placed Successfully", message: "Your Order No #\(orderNumber) will be dispatched shortly", preferredStyle: .alert)
        let action = UIAlertAction(title: "Thank You", style: .cancel) { (action) in
            ContentViewModel.shared.orderList.append(OrderData(orderId: orderNumber,
                                                               orderName: self.product.name,
                                                               orderPrice: self.product.price,
                                                               orderImageUrl: self.product.imageURL,
                                                               orderType: self.product.type))
            let mainController = self.navigationController?.viewControllers[1] as! MainContentViewController
            self.navigationController?.popToViewController(mainController, animated: true)
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}


extension PlaceOrderViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
       if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
       } else {
            textField.resignFirstResponder()
       }
       return false
    }
}

extension PlaceOrderViewController{
    static func shareInstance() -> PlaceOrderViewController{
        PlaceOrderViewController.instantiateFromStoryboard()
    }
}
