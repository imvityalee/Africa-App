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
            .navigationBarTitle(LocalazibleStrings.videos, displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                            videoModel.shuffle()
                            hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: LocalazibleImages.arrow_2)
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
