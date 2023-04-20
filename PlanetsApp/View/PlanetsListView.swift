//
//  PlanetsListView.swift
//  PlanetsApp
//
//  Created by Kesh Gurung on 18/04/2023.
//

import SwiftUI

struct PlanetsListView: View {
    @StateObject var viewModel: PlanetsViewModel
    @State private var isErrorOccured = true
    
    var body: some View {
            VStack {
                switch viewModel.viewState {
                case .loading:
                    ProgressView()
                case .loaded:
                    showPlanetsListView()
                case .error:
                    showErrorView()
                case .emptyView:
                    EmptyView()
                }
            }
            .navigationTitle(Text(LocalizedStringKey("PlanetsLists")))
            .task {
            await viewModel.getPlanetsList(path: RestApiEndPoints.planetsPath)
        }
    }
    
    @ViewBuilder
    func showPlanetsListView() -> some View {
        List(viewModel.planetsList){ planet in
            NavigationLink {
            }label: {
                Text(planet.name)
            }
        }
    }
    
    @ViewBuilder
    func showErrorView() -> some View {
        List(viewModel.corePlanetsList){ planet in
            NavigationLink {
            }label: {
                Text(planet.name ?? "")
            }
        }
    }
}

struct SchoolListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsListView(viewModel: PlanetsViewModel(repository: PlanetsRepository(serviceManager: RestApiManager()), coreRepository: CoreRepository()))
    }
}
