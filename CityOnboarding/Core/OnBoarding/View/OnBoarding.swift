//
//  OnBoarding.swift
//  CityOnboarding
//
//  Created by Prashanna Rajbhandari on 10/06/2023.
//

import SwiftUI

struct OnBoarding: View {
    
    @StateObject private var vm = OnBoardingViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                    .ignoresSafeArea()

                VStack(alignment: .leading) {
                    Image(vm.cities[vm.currentIndex].imageName)
                        .resizable()
                        .scaledToFit()

                    Texts(title: vm.cities[vm.currentIndex].title, desc: vm.cities[vm.currentIndex].desc)

                    Spacer()

                    if vm.currentIndex == 2{
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
                        Button()
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .onAppear{
                presentationMode.wrappedValue.dismiss()
            }
            .toolbar {
                if vm.currentIndex > 0 {
                    ToolbarItem(placement: .topBarLeading) {
                        Image(systemName: "arrowshape.backward.fill")
                            .onTapGesture {
                                vm.decreaseIndex()
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        OnBoarding()
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

    private func Button() -> some View {
        VStack {
            SwiftUI.Button(action: {
                vm.increaseIndex()
                
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
