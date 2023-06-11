//
//  Home.swift
//  CityOnboarding
//
//  Created by Prashanna Rajbhandari on 10/06/2023.
//

import SwiftUI

struct Home: View {
    
    @StateObject private var vm : HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack{
                    ListView()

                }.navigationBarBackButtonHidden()
            }

        }
    }
}

#Preview {
    NavigationStack {
        Home()
    }
}

extension Home{
    private func ListView() -> some View{
        VStack{
            List{
                Section("Garbage Routine") {
                    GarbageView()
                }
                
                Section("Transportation") {
                    Text("Make Sure to Download These Apps")
                    HStack{
                        ScrollView{
                            Image(systemName: "xmark.bin.fill")
                                .resizable().scaledToFit()
                                .frame(width: 40,height: 40)
                        }
                    }
                }
                
                Section("Emergency Contact") {
                    Text("Emergency Contact")
                }
                
                Section("Places to visit") {
                    NavigationLink(destination: MapView()) {
                        Text("Map")
                    }
                }
            }
        }
    }
}
