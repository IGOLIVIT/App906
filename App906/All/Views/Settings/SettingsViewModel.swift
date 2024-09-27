//
//  SettingsViewModel.swift
//  App906
//
//  Created by IGOR on 26/09/2024.
//

import SwiftUI
import CoreData

final class SettingsViewModel: ObservableObject {
    
    @Published var types: [String] = ["Drinks", "Food"]
    @Published var curTypeForAdd = "Drinks"
    @Published var curType = "Drinks"

    @Published var isAdd: Bool = false
    @Published var isDiscounts: Bool = false
    @Published var isDelete: Bool = false
        
    @Published var disName: String = ""
    @Published var disDescr: String = ""

    @Published var discounts: [DiscModel] = []
    @Published var selectedDiscount: DiscModel?
    
    func addDiscount() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "DiscModel", into: context) as! DiscModel
        
        loan.disName = disName
        loan.disDescr = disDescr

        CoreDataStack.shared.saveContext()
    }
    
    func fetchDiscounts() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<DiscModel>(entityName: "DiscModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.discounts = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.discounts = []
        }
    }
}
