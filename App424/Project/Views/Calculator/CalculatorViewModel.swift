//
//  CalculatorViewModel.swift
//  App424
//
//  Created by IGOR on 27/03/2024.
//

import SwiftUI
import CoreData

final class CalculatorViewModel: ObservableObject {

    @Published var types: [String] = ["Simple (x0.75)", "Simple (x1)", "Complex (x 1.25)"]
    @Published var currentType = ""
    
    @Published var CompLevel: String = ""
    @Published var NumIfElem: String = ""
    @Published var AvgDesTime: String = ""
    @Published var HoutlyRate: String = ""
    @Published var AddExpen: String = ""
    @Published var Profit: String = ""
    @AppStorage("number") var number: Int = 0

    
    @Published var calcTHours: String = ""
    @Published var calcTPrice: String = ""
    @Published var calcDate: Date = Date()
    @Published var calcNumber: Int = 0

    @Published var rth = String("\(String(format: "%.f", Double(.random(in: 1...9))))")
    @Published var rtp = String("\(String(format: "%.f", Double(.random(in: 1...9)))),\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...9))))")
    
    @Published var isAdd: Bool = false
    @Published var isCurr: Bool = false
    @Published var isDetail: Bool = false
    @Published var isChart: Bool = false
    @Published var isDelete: Bool = false
    @Published var isEdit: Bool = false
    @Published var isCalculate: Bool = false

    @Published var calculations: [CalcModel] = []
    @Published var selectedCalc: CalcModel?

    func addCalc() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CalcModel", into: context) as! CalcModel

        loan.calcTHours = calcTHours
        loan.calcTPrice = calcTPrice
        loan.calcNumber = Int16(calcNumber)
        loan.calcDate = calcDate

        CoreDataStack.shared.saveContext()
    }
    
    func fetchCalc() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CalcModel>(entityName: "CalcModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.calculations = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.calculations = []
        }
    }
}
