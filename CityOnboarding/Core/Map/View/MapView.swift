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
    
    var body: some View {
        Map{
            Marker("LalBagh", coordinate: vm.lalBagh)
            Marker("Cubbon Park", coordinate: vm.cubbon)
            Marker("Bangalore Palace", coordinate: vm.palace)
        }
        .mapStyle(.standard)
    }
}

#Preview {
    MapView()
}
