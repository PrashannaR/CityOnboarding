//
//  GarbageView.swift
//  CityOnboarding
//
//  Created by Prashanna Rajbhandari on 11/06/2023.
//

import SwiftUI

struct GarbageView: View {
    let daysOfWeek = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
       let values = ["DRY", "WET", "DRY", "WET", "DRY", "WET", "DRY"]
       
       var body: some View {
           VStack(alignment:.leading){
               // Header Row
               HStack {
                   Image(systemName: "xmark.bin.fill")
                       .resizable()
                       .scaledToFit()
                       .frame(width: 40,height: 40)
                   .foregroundColor(Color.theme.darkPurple)
                   
                   Text("Make sure to take the correct one :)")
                       .font(.callout)
                       .fontWeight(.semibold)
               }
               Spacer()
               HStack() {
                   ForEach(0..<daysOfWeek.count-1) { index in
                       HStack {
                           VStack{
                               Text(daysOfWeek[index])
                                   .font(.caption)
                                   .fontWeight(.semibold)
                               Text(values[index])
                           }
                           
                           Rectangle()
                               .frame(width: 0.5,height: 15)
                       }
                   }
                   VStack{
                       Text(daysOfWeek[6])
                           .font(.caption)
                           .fontWeight(.semibold)
                       Text(values[6])
                           
                   }
               }.padding(.leading)
                   .font(.caption)
               
               Spacer()
               
           }.frame(height: 100)
           
       }
   }

#Preview {
    GarbageView()
}
