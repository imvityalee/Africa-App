//
//  GalleryView.swift
//  Africa-App
//
//  Created by Victor Lee on 6/7/21.
//

import SwiftUI

struct GalleryView: View {

    @State private var selectedAnimal: String = LocalazibleStrings.lion
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    private let animals: [AnimalsModel] =
        Bundle.main.decode(LocalazibleStrings.animalsJson)
    private let haptics =
        UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            
            VStack(alignment: .center, spacing: 10) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle()
                                .stroke(Color.white,
                                        lineWidth: 8))
                Slider(value: $gridColumn,
                       in: 2...4,
                       step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn,
                              perform: { value in
                        gridSwitch()
                    })
                
                LazyVGrid(columns: gridLayout,
                          alignment: .center,
                          spacing: 5) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle()
                                        .stroke(Color.white,
                                                lineWidth: 1)
                            )
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }
                }
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        })
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .center)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

extension GalleryView {
    private func gridSwitch() {
        gridLayout = Array(repeating:
                            .init(.flexible()),
                           count: Int(gridColumn))
    }
}
