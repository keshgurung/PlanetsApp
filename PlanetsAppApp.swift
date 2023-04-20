//
//  PlanetsAppApp.swift
//  PlanetsApp
//
//  Created by Kesh Gurung on 18/04/2023.
//

import SwiftUI

@main
struct PlanetsAppApp: App {
    let dataController = DataController.shared
    var body: some Scene {
        WindowGroup {
            PlanetsListView(viewModel: PlanetsViewModel(repository: PlanetsRepository(serviceManager: RestApiManager()), coreRepository: CoreRepository())).environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
