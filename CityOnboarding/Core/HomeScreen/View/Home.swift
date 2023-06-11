//
//  Home.swift
//  CityOnboarding
//
//  Created by Prashanna Rajbhandari on 10/06/2023.
//

import SwiftUI

struct Home: View {
    
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
                Section("Basic Rules") {
                    Text("hehe")
                }
                
                Section("Transportation") {
                    Text("Transportation")
                }
                
                Section("Emergency Contact") {
                    Text("Emergency Contact")
                }
                
                Section("Places to visit") {
                    Text("Places to Visit")
                }
            }
        }
    }
}
