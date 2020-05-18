//
//  UIExtensions.swift
//  goAmaze
//
//  Created by Roushil singla on 3/26/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView{

    func loadImageUsingCache(image: String){
    
        self.image = nil
        if let cachedImage = imageCache.object(forKey: image as NSString) as? UIImage{

            self.image = cachedImage
            return
        }
        guard let url = URL(string: image) else { return }
        guard let imageData = try? Data(contentsOf: url) else { return }
        let thumbImage = UIImage(data: imageData)
        imageCache.setObject(thumbImage!, forKey: image as NSString)
        self.image = thumbImage
    }
}

extension UIViewController{
    
    class func instantiateFromStoryboard(_ name: String = "Main") -> Self {
        return instantiateFromStoryboardHelper(name)
    }
    
    fileprivate class func instantiateFromStoryboardHelper<T>(_ name: String) -> T {
        let controller = UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: "\(Self.self)") as! T
        return controller
    }
}

extension UILabel{
    
    func underline(){
        
        let border = CALayer()
        let width = CGFloat(4.0)
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0,
                              y: self.frame.size.height - width,
                              width: 200,
                              height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}

extension UITextField{
    
    func underline(changeColor: Bool){
        
        let border = CALayer()
        let width = CGFloat(1.0)
        changeColor == true ? (border.borderColor = UIColor.systemOrange.cgColor) : (border.borderColor = UIColor.darkGray.cgColor)
        border.frame = CGRect(x: 0,
                              y: self.frame.size.height - width,
                              width: self.frame.size.width,
                              height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}

extension UIButton{
    
    func drawBorder(){
        
        self.layer.borderColor = UIColor.green.cgColor
        self.layer.borderWidth = 1.0
    }
    
    func shake(){
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        shake.fromValue = fromValue
        shake.toValue = toValue
        layer.add(shake, forKey: nil)
    }
}
