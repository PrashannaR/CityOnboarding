//
//  PreviewSampleData.swift
//  CityOnboarding
//
//  Created by Yaseen Majeed on 11/06/23.
//

import Foundation
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: City.self, ModelConfiguration(inMemory: true)
        )
        for city in SampleData.contents {
            container.mainContext.insert(object: city)
        }
//        UserDefaults.standard.setValue(true, forKey: "hasOnboarded")
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
