//
//  OnBoardingViewModel.swift
//  CityOnboarding
//
//  Created by Prashanna Rajbhandari on 11/06/2023.
//

import Foundation


class OnBoardingViewModel : ObservableObject{
    
    @Published var currentIndex = 0
    
    let cities = [
        City(id: "1", imageName: "blr", title: "Bangalore", desc: "Bangalore, the \"Silicon Valley of India,\" is a vibrant city renowned for its booming tech industry, rich history, and diverse cultural scene. From iconic landmarks to a pleasant climate and global cuisine, it offers an enchanting experience for all."),
        City(id: "2", imageName: "blr", title: "Bangalore", desc: "Desc 2"),
        City(id: "3", imageName: "blr", title: "Bangalore", desc: "Desc 3"),
    ]
    
    func increaseIndex(){
        currentIndex = (currentIndex+1) % cities.count
    }
    
    func decreaseIndex(){
        currentIndex = (currentIndex-1) % cities.count
    }
    
}
