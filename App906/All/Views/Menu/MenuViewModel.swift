//
//  MenuViewModel.swift
//  App906
//
//  Created by IGOR on 25/09/2024.
//

import SwiftUI
import CoreData

final class MenuViewModel: ObservableObject {

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isSettings: Bool = false
    @Published var isAddCatFood: Bool = false
    @Published var isAddCatDrinks: Bool = false
    @Published var isAddCatAuthors: Bool = false
    
    @AppStorage("RPD") var RPD: String = ""
    @AppStorage("TR") var TR: String = ""
    @AppStorage("beverages") var beverages: String = ""
    @AppStorage("Desserts") var Desserts: String = ""
    @AppStorage("HorsD") var HorsD: String = ""
    
    @Published var addRPD = ""
    @Published var addTR = ""
    @Published var addBev = ""
    @Published var addDess = ""
    @Published var addHors = ""
    
    @AppStorage("categories") var categories: [String] = ["Drinks", "Food", "Authors"]
    @Published var currCategory = "Drinks"


    @AppStorage("categotiesDrinks") var categotiesDrinks: [String] = ["Coffee", "Tea", "Lemonade"]
    @Published var currentCategoryDrinks = "Tea"
    @AppStorage("categotiesFood") var categotiesFood: [String] = ["Desserts", "Croissants"]
    @Published var currentCategoryFood = "Desserts"
    @AppStorage("categotiesAuthors") var categotiesAuthors: [String] = ["Drinks", "Food"]
    @Published var currentCategoryAuthors = "Drinks"
    
    @Published var pictures: [String] = ["Espresso", "Cappuccino", "Latte", "Americano", "Rafe", "Mocha", "Black Tea", "Berry Tea", "Chocolate flan", "Tiramisu", "Cherry cheesecake", "Strawberry", "Chocolate", "Caramel", "Salmon", "Chicken", "Cherry cheesecake", "Chocolate cheesecake", "Green cake", "Kiwi cake", "Lemon mohito", "Moose mix", "Moosse matcha", "Pinapple", "Red and Lemon", "Strawberry milkshake", "Strawberry mohito"]
    @Published var currentPicForAdd = ""
    
    @Published var typeForAdd: String = ""
    
    @Published var sizes: [String] = ["Small", "Medium", "Large"]
    @Published var curSizeForAdd = "Small"
    
    @Published var menName: String = ""
    @Published var menPhoto: String = ""
    @Published var menType: String = ""
    @Published var menAllergens: String = ""
    @Published var menIng: String = ""
    @Published var menSize: String = ""
    @Published var menSizeOp: String = ""
    @Published var menPrice: String = ""
    @Published var menCPrice: String = ""
    @Published var menDescr: String = ""

    @Published var menues: [MenuModel] = []
    @Published var selectedMenu: MenuModel?
    
    func addMenu() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "MenuModel", into: context) as! MenuModel
        
        loan.menName = menName
        loan.menPhoto = menPhoto
        loan.menType = menType
        loan.menAllergens = menAllergens
        loan.menIng = menIng
        loan.menSize = menSize
        loan.menSizeOp = menSizeOp
        loan.menPrice = menPrice
        loan.menCPrice = menCPrice
        loan.menDescr = menDescr

        CoreDataStack.shared.saveContext()
    }
    
    func fetchMenues() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MenuModel>(entityName: "MenuModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.menues = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.menues = []
        }
    }
}
