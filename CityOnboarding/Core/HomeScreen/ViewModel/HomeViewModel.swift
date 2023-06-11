//
//  HomeViewModel.swift
//  CityOnboarding
//
//  Created by Prashanna Rajbhandari on 11/06/2023.
//

import Foundation

struct Days: Identifiable{
    let id : Int
    var day : String
    var type : String
}

class HomeViewModel : ObservableObject{
    @Published var day : [Days] = [
        Days(id: 1, day: "Sun", type: "Dry"),
        Days(id: 2, day: "Mon", type: "Wet"),
        Days(id: 3, day: "Tue", type: "Dry"),
        Days(id: 4, day: "Wed", type: "Wet"),
        Days(id: 5, day: "Thu", type: "Dry"),
        Days(id: 6, day: "Fri", type: "Wet"),
        Days(id: 7, day: "Sat", type: "Dry")
        
    ]
    
}
