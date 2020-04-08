//
//  CoreDataService.swift
//  goAmaze
//
//  Created by Roushil singla on 4/9/20.
//  Copyright © 2020 personal. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataService: NSObject{
    static let shared = CoreDataService()
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func saveData(name: String, email: String, password: String){
        
        let users = NSEntityDescription.insertNewObject(forEntityName: "Authentication", into: context!) as! Authentication
        users.name = name
        users.email = email
        users.password = password
        do{
            try context?.save()
            print("Data Saved")
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func fetchData() -> [Authentication]{
        
        var fetchData:[Authentication] = []
        let request:NSFetchRequest<Authentication> = Authentication.fetchRequest()
        do{
            fetchData = try (context?.fetch(request))!
        }catch{
            print(error.localizedDescription)
        }
        return fetchData
    }
}
