//
//  InsentMapView.swift
//  Africa-App
//
//  Created by Victor Lee on 8/7/21.
//

import SwiftUI
import MapKit

struct InsentMapView: View {
    @State private var region =
        MKCoordinateRegion(center: CLLocationCoordinate2D(
                            latitude: 6.600286,
                            longitude: 16.4377599),
                           span: MKCoordinateSpan(
                            latitudeDelta: 60.0,
                            longitudeDelta: 60.0))
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(
                    destination: MapView()){
                    HStack {
                        Image(systemName: LocalazibleImages.mappin_circle)
                            .foregroundColor(Color.white)
                            .imageScale(.large)
                        Text(LocalazibleStrings.locations)
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    )
                }
                .padding(12),alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsentMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsentMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
