//
//  ExternalWebLinkView.swift
//  Africa-App
//
//  Created by Victor Lee on 8/7/21.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let animalsModel: AnimalsModel
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: LocalazibleImages.arrow_up_right)
                    Link(animalsModel.name,
                         destination: (URL(string: animalsModel.link) ??
                                        URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            }
        }
        
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [AnimalsModel] = Bundle.main.decode(LocalazibleStrings.animalsJson)
    
    static var previews: some View {
        ExternalWebLinkView(animalsModel: animals[3])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
