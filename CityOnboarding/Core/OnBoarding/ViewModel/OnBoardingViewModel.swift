//
//  OnBoardingViewModel.swift
//  CityOnboarding
//
//  Created by Prashanna Rajbhandari on 11/06/2023.
//

import SwiftUI
import SwiftData


class OnBoardingViewModel : ObservableObject {
    
    @Published var currentIndex = 0
    let container = previewContainer
//    let cities = data.mainContext.fetch(<#T##SwiftData.FetchDescriptor<T>#>)
    @Query var cities: [City]
    
    func increaseIndex(){
        currentIndex = (currentIndex+1) % cities.count
    }
    
    func decreaseIndex(){
        currentIndex = (currentIndex-1) % cities.count
    }
    
}
