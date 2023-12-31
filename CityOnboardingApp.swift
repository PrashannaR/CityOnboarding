//
//  CityOnboardingApp.swift
//  CityOnboarding
//
//  Created by Prashanna Rajbhandari on 10/06/2023.
//

import SwiftUI
import SwiftData

@main
struct CityOnboardingApp: App {

    var body: some Scene {
        WindowGroup {
            OnBoarding()
        }
        .modelContainer(for: City.self)
    }
}
