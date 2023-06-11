//
//  Polyline.swift
//  CityOnboarding
//
//  Created by Prashanna Rajbhandari on 11/06/2023.
//

import SwiftUI
import MapKit
struct Polyline: View {
    var coordinates : [CLLocationCoordinate2D]
    var body: some View {
        if coordinates.count >= 2 {
            MapOverlay(polyline: MKPolyline(coordinates: coordinates, count: coordinates.count))
        } else {
            EmptyView()
        }
    }
}
struct MapOverlay: UIViewRepresentable {
    var polyline: MKPolyline

    func makeUIView(context: Context) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.strokeColor = .red
        renderer.lineWidth = 3
        return renderer
    }

    func updateUIView(_ uiView: MKOverlayRenderer, context: Context) {
        if let renderer = uiView as? MKPolylineRenderer {
            renderer.polyline = polyline
        }
    }
}


#Preview {
    Polyline(coordinates: <#[CLLocationCoordinate2D]#>)
}
