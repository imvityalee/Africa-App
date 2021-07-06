//
//  MainView.swift
//  Africa-App
//
//  Created by Victor Lee on 6/7/21.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    TabView {
      ContentView()
        .tabItem {
            Image(systemName: LocalazibleImages.squareImage)
            Text(LocalazibleStrings.browse)
        }
      
      VideoListView()
        .tabItem {
          Image(systemName: "play.rectangle")
          Text("Watch")
        }
      
      MapView()
        .tabItem {
          Image(systemName: "map")
          Text("Locations")
        }
      
      GalleryView()
        .tabItem {
          Image(systemName: "photo")
          Text("Gallery")
        }
    } //: TAB
  }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
