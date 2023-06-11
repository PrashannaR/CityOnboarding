//
//  OnBoarding.swift
//  CityOnboarding
//
//  Created by Prashanna Rajbhandari on 10/06/2023.
//

import SwiftUI
import SwiftData

struct OnBoarding: View {
    
//    @StateObject private var vm = OnBoardingViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var moc
    
    @Query(sort: \.id) var cities: [City]
    
    @State private var index = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                if UserDefaults.standard.bool(forKey: "hasOnboarded") == true {
                    Home()
                }
                else if !cities.isEmpty {
                    VStack(alignment: .leading) {
                        Image(cities[index].imageName)
                            .resizable()
                            .scaledToFit()
                        
                        Texts(title: cities[index].title, desc: cities[index].desc)
                        
                        Spacer()
                        
                        if index == cities.count - 1 {
                            NavigationLink(destination: Home()) {
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 75)
                                    .padding()
                                    .overlay(alignment: .center) {
                                        Text("Finish")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundStyle(Color.white)
                                    }
                            }
                            
                        }else{
                            nextButton()
                        }
                    }
                } else {
                    Text("No data yet")
                }
            }
            .navigationBarBackButtonHidden()
            .onAppear{
                index = 0
                presentationMode.wrappedValue.dismiss()
                let hasOnboarded = UserDefaults.standard.bool(forKey: "hasOnboarded")
                
                if !hasOnboarded {
                    for city in SampleData.contents {
                        moc.insert(object: city)
                    }
//                    UserDefaults.standard.setValue(true, forKey: "hasOnboarded")
                }
                
            }
            .toolbar {
                if index > 0 {
                    ToolbarItem(placement: .topBarLeading) {
                        Image(systemName: "arrowshape.backward.fill")
                            .onTapGesture {
                                index = (index - 1) % cities.count
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        OnBoarding().modelContainer(previewContainer)
    }
}

extension OnBoarding {
    private func Texts(title: String, desc: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)

            Text(desc)
                .font(.headline)
        }
        .padding()
        .foregroundStyle(Color.black)
    }

    private func nextButton() -> some View {
        VStack {
            Button(action: {
                index = (index + 1) % cities.count
                
            }, label: {
                RoundedRectangle(cornerRadius: 15)
                    .frame(maxWidth: .infinity)
                    .frame(height: 75)
                    .padding()
                    .overlay(alignment: .center) {
                        Text("Next")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                    }

            })
        }
    }
}
