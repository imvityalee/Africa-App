//
//  ContentView.swift
//  Africa-App
//
//  Created by Victor Lee on 6/7/21.
//

import SwiftUI

struct ContentView: View {
    
    private let animalsModel: [AnimalsModel] =
        Bundle.main.decode(LocalazibleStrings.animalsJson)
    private let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] =
        [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    private func gridSwitch() {
        gridLayout = Array(
            repeating: .init(.flexible()),
            count: gridLayout.count % 3 + 1
        )
        
        gridColumn = gridLayout.count
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300,
                                   alignment: .center)
                            .listRowInsets(EdgeInsets(top: 0,
                                                      leading: 0,
                                                      bottom: 0,
                                                      trailing: 0))
                        ForEach(animalsModel) { animal in
                            NavigationLink(destination:
                                            AnimalDetailView(animalsModel: animal)) {
                                AnimalListItemView(animalModel: animal)
                            }
                        }
                    }
                } else {
                    ScrollView(.vertical) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animalsModel) { animal in
                                NavigationLink(destination: AnimalDetailView(animalsModel: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding(10)
                        .animation(.easeIn)
                    }
                }
            }
            .navigationBarTitle(LocalazibleStrings.africa,
                                displayMode: .large)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            print("List View is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary: .accentColor)
                        })
                        Button(action: {
                            print("Grid view is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor: .primary)
                        })
                    }
                }
            })
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

