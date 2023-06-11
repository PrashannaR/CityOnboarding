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
                            
                            Link(destination: URL(string: "https://www.swiggy.com")!, label: {
                                Image("swiggy")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 55, height: 55)
                                
                            })
                            
                            Link(destination: URL(string: "https://tummoc.com")!
                                 , label: {
                                Image("tummoc")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 55, height: 55)
                                    .cornerRadius(10)
                            })
                            
                            Link(destination: URL(string: "https://www.yulu.bike")!, label: {
                                Image("yulu")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 55, height: 55)
                            })
                            
                            Link(destination: URL(string: "https://moovitapp.com/bengaluru-3620/poi/en-gb")!, label: {
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
                    HStack {
                        Spacer()
                        VStack {
                            dialPhone(phoneNumber: phoneNumber1, image: "police")
                        }
                        dialPhone(phoneNumber: phoneNumber2, image: "ambulance")
                        Spacer()
                    }
                }
                
                Section("Places to visit") {
                    NavigationLink(destination: MapView()) {
                        Text("Explore Bangalore!")
                            .font(.headline)
                    }
                }
            }
        }
    }
    
    private func dialPhone(phoneNumber : String, image: String) -> some View{
        VStack {
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 69, height: 69)
                .onTapGesture {
                    guard let url = URL(string: "tel:\(phoneNumber)") else { return }
                    UIApplication.shared.open(url)
                }
                .padding(.trailing)
                        

        }
    }
}
