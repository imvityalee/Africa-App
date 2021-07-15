//
//  VideoListView.swift
//  Africa-App
//
//  Created by Victor Lee on 6/7/21.
//

import SwiftUI

struct VideoListView: View {
    @State var videoModel: [AnimalVideoModel] =
        Bundle.main.decode(LocalazibleStrings.animalVideoJson)
    let hapticImpact: UIImpactFeedbackGenerator
        = UIImpactFeedbackGenerator.init(style: .medium)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videoModel) { item in
                    NavigationLink(
                        destination:
                            VideoPlayerView(videoSelected: item.id,
                                            videoTitle: item.name))  {
                        VideoListItemView(videoModel: item)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                            videoModel.shuffle()
                            hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            }
             
        }

    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
