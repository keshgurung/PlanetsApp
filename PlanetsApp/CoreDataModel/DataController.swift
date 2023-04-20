//
//  DataController.swift
//  PlanetsApp
//
//  Created by Kesh Gurung on 18/04/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    static let shared = DataController()
    let container = NSPersistentContainer(name: "PlanetsApp")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved successfully!!")
        } catch {
            // Handle errors in our database
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func deletePlanets() {
        let context = self.container.viewContext
        let request: NSFetchRequest<PlanetEntity> = PlanetEntity.fetchRequest()
        do {
            let results = try context.fetch(request)
            for result in results {
                context.delete(result)
            }
        } catch {
            print(error)
        }
        self.save(context: context)
    }
    
    func fetchPlanets() -> [PlanetEntity]? {
        let context = self.container.viewContext
        let request: NSFetchRequest<PlanetEntity> = PlanetEntity.fetchRequest()
        do {
            let results = try context.fetch(request)
            return results.reversed()
        } catch {
            print(error)
        }
        return nil
    }
    
    func addPlanets(planets: [Planet]) {
        planets.forEach {
            let planetEntity = PlanetEntity(context: container.viewContext)
            planetEntity.name = $0.name
        }
        save(context: container.viewContext)
    }
}
