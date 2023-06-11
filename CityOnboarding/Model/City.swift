//
//  City.swift
//  CityOnboarding
//
//  Created by Prashanna Rajbhandari on 11/06/2023.
//

import Foundation
import SwiftData

@Model
final class City : Identifiable, Equatable{
    let id : String
    let imageName : String
    let title : String
    let desc : String
    
    init(id: String, imageName: String, title: String, desc: String) {
        self.id = id
        self.imageName = imageName
        self.title = title
        self.desc = desc
    }
    
    static func == (lhs: City, rhs: City) -> Bool {
        lhs.id == rhs.id
    }
    
}





