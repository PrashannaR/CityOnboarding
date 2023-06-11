//
//  MapViewModel.swift
//  CityOnboarding
//
//  Created by Prashanna Rajbhandari on 11/06/2023.
//

import Foundation
import MapKit

class MapViewModel : ObservableObject{
    let lalBagh = CLLocationCoordinate2D(latitude: 12.9507, longitude: 77.5848)
    let cubbon = CLLocationCoordinate2D(latitude: 12.9779, longitude: 77.5952)
    let palace = CLLocationCoordinate2D(latitude: 13.0035, longitude: 77.5891)
    
    let currLoc = CLLocationCoordinate2D(latitude: 12.92886, longitude: 77.692569)
    
    lazy var coordArray = [lalBagh, cubbon, palace, currLoc]
    
    var polylines: [MKPolyline] = []
    var route: MKRoute = .init()
    
    func getRoute() {
        let request = MKDirections.Request()
                request.source = MKMapItem(placemark: MKPlacemark(coordinate: currLoc, addressDictionary: nil))
                request.destination = MKMapItem(placemark: MKPlacemark(coordinate: cubbon, addressDictionary: nil))
                request.requestsAlternateRoutes = true
                request.transportType = .automobile

                let directions = MKDirections(request: request)

                directions.calculate { [unowned self] response, error in
                    guard let unwrappedResponse = response else { return }

                    if let route = unwrappedResponse.routes.first {
                        print("Found a route!!!")
                        DispatchQueue.main.async {
                            self.route = route
                        }
                    }
//                    for route in unwrappedResponse.routes {
////                        self.mapView.addOverlay(route.polyline)
////                        self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
//                        DispatchQueue.main.async {
////                            self.polylines = MapPolyline(route)
//                        }
//                    }
                }
    }
}
