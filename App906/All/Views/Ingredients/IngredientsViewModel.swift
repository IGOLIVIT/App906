//
//  IngredientsViewModel.swift
//  App906
//
//  Created by IGOR on 25/09/2024.
//

import SwiftUI
import CoreData

final class IngredientsViewModel: ObservableObject {
    
    @Published var types: [String] = ["Drinks", "Food"]
    @Published var curTypeForAdd = "Drinks"
    @Published var curType = "Drinks"

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isSettings: Bool = false
    @Published var isAddCatFood: Bool = false
    @Published var isAddCatDrinks: Bool = false
    @Published var isAddCatAuthors: Bool = false
        
    @Published var inName: String = ""
    @Published var inType: String = ""
    @Published var inWeight: String = ""
    @Published var inBrand: String = ""
    @Published var inPrice: String = ""

    @Published var ingredients: [IngredModel] = []
    @Published var selectedIngredient: IngredModel?
    
    func addIngredient() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "IngredModel", into: context) as! IngredModel
        
        loan.inName = inName
        loan.inType = inType
        loan.inWeight = inWeight
        loan.inBrand = inBrand
        loan.inPrice = inPrice

        CoreDataStack.shared.saveContext()
    }
    
    func fetchIngredients() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<IngredModel>(entityName: "IngredModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.ingredients = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.ingredients = []
        }
    }
}
