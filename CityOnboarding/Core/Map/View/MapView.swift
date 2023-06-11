//
//  MapView.swift
//  CityOnboarding
//
//  Created by Prashanna Rajbhandari on 11/06/2023.
//

import SwiftUI
import MapKit
struct MapView: View {
    
    @StateObject private var vm = MapViewModel()
    @State private var selectTag : Int?
    
//    @State var routePolylines : [MKPolyline] = []
//    @State var
    var body: some View {
        Map(selection: $selectTag) {
            Marker("You", coordinate: vm.currLoc)
                .tag(0)
//            MapPolyline(coordinates: [vm.currLoc,vm.lalBagh])
//                .annotationSubtitles(.visible)
            Marker("LalBagh", coordinate: vm.lalBagh)
                .tag(1)
                
            Marker("Cubbon Park", coordinate: vm.cubbon)
                .tag(2)
            
            Marker("Bangalore Palace", coordinate: vm.palace)
                .tag(3)
                

            MapPolyline(vm.route)
                .foregroundStyle(Color.red)
                .mapOverlayLevel(level: .aboveRoads)
                .stroke(lineWidth: 2)
            MapPolygon(coordinates: vm.coordArray)
                .foregroundStyle(Color.clear.opacity(0.4))
                .stroke(Color.red, lineWidth: 3)
                
        }
        .onAppear {
            vm.getRoute()
        }

        .mapStyle(.standard)
        
        
    }
    
    

}

#Preview {
    MapView()
}
