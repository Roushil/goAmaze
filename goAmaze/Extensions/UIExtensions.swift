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
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            DispatchQueue.main.async {
                
                guard let downloadedImage = UIImage(data: data) else { return }
                imageCache.setObject(downloadedImage, forKey: image as NSString)
                self.image = downloadedImage
            }
        }.resume()
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
        border.borderColor = UIColor.darkGray.cgColor
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
        changeColor == true ? (border.borderColor = UIColor.green.cgColor) : (border.borderColor = UIColor.darkGray.cgColor)
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
}
