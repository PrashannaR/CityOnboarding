//
//  Home.swift
//  CityOnboarding
//
//  Created by Prashanna Rajbhandari on 10/06/2023.
//

import SwiftUI

struct Home: View {
    
    
    @StateObject private var vm : HomeViewModel = HomeViewModel()
    
    let phoneNumber1 = "112"
    let phoneNumber2 = "8888888888"
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                
                VStack{
                    ListView()
                    
                }.navigationBarBackButtonHidden()
            }
            .onAppear{
                UserDefaults.standard.setValue(true, forKey: "hasOnboarded")
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
                    VStack (alignment:.leading){
                        HStack{
                            Image(systemName: "car.side.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40,height: 40)
                                .foregroundColor(Color.theme.darkPurple)
                            Text("Make Sure to Download These Apps")
                                .font(.callout)
                                .fontWeight(.semibold)
                        }
                        
                        HStack{
                            Spacer()
                            
                            Link(destination: URL(string: "https://apps.apple.com/in/app/swiggy-food-order-delivery/id989540920")!, label: {
                                Image("swiggy")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 55, height: 55)
                                
                            })
                            
                            Link(destination: URL(string: "https://apps.apple.com/in/app/tummoc-bmtc-ticket-tracking/id1534144729")!
                                 , label: {
                                Image("tummoc")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 55, height: 55)
                                    .cornerRadius(10)
                            })
                            
                            Link(destination: URL(string: "https://apps.apple.com/in/app/yulu-top-ebike-sharing-app/id1331504548")!, label: {
                                Image("yulu")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 55, height: 55)
                            })
                            
                            Link(destination: URL(string: "https://apps.apple.com/in/app/moovit-public-transport-live/id498477945")!, label: {
                                Image("moovit")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 55, height: 55)
                            })
                            
                            Spacer()
                            
                            
                        }
                    }

                }
                
                Section("Emergency Contact") {
                    dialPhone(phoneNumber: phoneNumber1)
                }
                
                Section("Places to visit") {
                    NavigationLink(destination: MapView()) {
                        Text("Map")
                    }
                }
            }
        }
    }
    
    private func dialPhone(phoneNumber : String) -> some View{
        HStack {
            Spacer()
            Image("police")
                .resizable()
                .scaledToFit()
                .frame(width: 69, height: 69)
                .onTapGesture {
                    guard let url = URL(string: "tel:\(phoneNumber)") else { return }
                    UIApplication.shared.open(url)
                }
                .padding(.trailing)
            
            Image("ambulance")
                .resizable()
                .scaledToFit()
                .frame(width: 69, height: 69)
                .onTapGesture {
                    guard let url = URL(string: "tel:\(phoneNumber)") else { return }
                    UIApplication.shared.open(url)
                }
            
            Spacer()

            

        }
    }
}
