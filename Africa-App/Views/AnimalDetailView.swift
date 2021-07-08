//
//  AnimalDetailView.swift
//  Africa-App
//
//  Created by Victor Lee on 8/7/21.
//

import SwiftUI

struct AnimalDetailView: View {
    
    let animalsModel: AnimalsModel
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(alignment: .center, spacing: 20) {
                Image(animalsModel.image)
                    .resizable()
                    .scaledToFit()
                Text(animalsModel.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                Text(animalsModel.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                Group {
                    HeadingView(headingImage: LocalazibleImages.rectangledPhoto, headingText: LocalazibleStrings.wildeerness_in_pictures)
                    InsentGalleryView(animalsModel: animalsModel)
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(headingImage: LocalazibleImages.questionMarkCircle, headingText: LocalazibleStrings.did_you_know)
                    InsentFactView(animalsModel: animalsModel)
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(headingImage: LocalazibleImages.info_circle, headingText: "All about \(animalsModel.name)")
                    Text(animalsModel.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(headingImage: LocalazibleImages.map, headingText: LocalazibleStrings.national_parks)
                    InsentMapView()
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    ExternalWebLinkView(animalsModel: animalsModel)
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("Learn about \(animalsModel.name)", displayMode: .inline)
        }
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    
    static let animals: [AnimalsModel] =
        Bundle.main.decode(LocalazibleStrings.animalsJson)
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animalsModel: animals[2])
        }
    }
}
