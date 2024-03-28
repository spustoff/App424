//
//  DashboardViewModel.swift
//  App424
//
//  Created by IGOR on 25/03/2024.
//

import SwiftUI
import CoreData

final class DashboardViewModel: ObservableObject {

    @Published var types: [String] = ["Active", "Completed"]
    @Published var currentType = "Active"
    
    @Published var projCategory: String = ""
    @Published var projName: String = ""
    @Published var projDeadline: String = ""
    @Published var projDate: String = ""
    @Published var projPrice: String = ""
    @Published var projDescription: String = ""

    
    @Published var isAdd: Bool = false
    @Published var isCurr: Bool = false
    @Published var isDetail: Bool = false
    @Published var isChart: Bool = false
    @Published var isDelete: Bool = false
    @Published var isEdit: Bool = false

    @Published var projects: [ProjectModel] = []
    @Published var selectedProject: ProjectModel?

    func addProject() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ProjectModel", into: context) as! ProjectModel

        loan.projCategory = projCategory
        loan.projName = projName
        loan.projDeadline = projDeadline
        loan.projDate = projDate
        loan.projPrice = Int16(projPrice) ?? 0
        loan.projDescription = projDescription

        CoreDataStack.shared.saveContext()
    }
    
    func fetchProjects() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ProjectModel>(entityName: "ProjectModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.projects = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.projects = []
        }
    }
    
    @Published var isSavedProj: Bool = false
    
    @AppStorage("proj_saved") var proj_saved: [String] = []
    
    func getFavoritedProj() -> [ProjectModel] {
        
        return currentType == "Active" ? projects.filter{!proj_saved.contains($0.projName ?? "")} : projects.filter{proj_saved.contains($0.projName ?? "")}
    }
    
    func favoritesManager(_ audio: ProjectModel?) {
        
        guard let title = audio?.projName else { return }
        
        if proj_saved.contains(title) {
            
            if let indexer = proj_saved.firstIndex(of: title) {
                
                proj_saved.remove(at: indexer)
            }
            
        } else {
            
            proj_saved.append(title)
        }
    }
    
    func isFavorited(_ audio: ProjectModel?) -> Bool {
        
        guard let title = audio?.projName else { return false }
        
        return proj_saved.contains(title) ? true : false
    }
}

