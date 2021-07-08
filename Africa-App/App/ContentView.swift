//
//  ContentView.swift
//  Africa-App
//
//  Created by Victor Lee on 6/7/21.
//

import SwiftUI

struct ContentView: View {
    
    let animalsModel: [AnimalsModel] = Bundle.main.decode(LocalazibleStrings.animalsJson)
    
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300, alignment: .center)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                ForEach(animalsModel) { animal in
                    NavigationLink(destination: AnimalDetailView(animalsModel: animal)) {
                        AnimalListItemView(animalModel: animal)
                    }
                                        
                }
                
                
            }
            .navigationBarTitle(LocalazibleStrings.africa, displayMode: .large)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
