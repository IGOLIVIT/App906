//
//  HomeViewModel.swift
//  App906
//
//  Created by IGOR on 24/09/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @AppStorage("total") var total: Int = 0
    
    @Published var statuses: [String] = ["In Progress", "Completed", "On Pause"]
    @Published var currentStatus = "In Progress"
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isSettings: Bool = false
    @Published var isRPD: Bool = false
    @Published var isTR: Bool = false
    @Published var isTSPD: Bool = false
    
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

    @Published var exName: String = ""
    @Published var exWeight: String = ""
    @Published var exCost: String = ""
    @Published var exTotal: String = ""

    @Published var expenses: [ExpModel] = []
    @Published var selectedExpense: ExpModel?
    
    func addExpense() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ExpModel", into: context) as! ExpModel
        
        loan.exName = exName
        loan.exWeight = exWeight
        loan.exCost = exCost
        loan.exTotal = exTotal

        CoreDataStack.shared.saveContext()
    }
    
    func fetchExpenses() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ExpModel>(entityName: "ExpModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.expenses = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.expenses = []
        }
    }
}
