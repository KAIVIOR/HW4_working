//
//  AppView.swift
//  Food2
//
//  Created by User04 on 2020/11/30.
//

import SwiftUI

struct AppView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var loversData = LoversData()
    var body: some View {
        VStack {
            
            NavigationView {
                 VStack {
               //     GeometryReader { geometry in
                    Image("3")
                        .resizable(resizingMode: .tile)
                        .scaledToFit()
                        .scaledToFill()
                        .offset(x: 0, y: 0.5)
                       .frame(width:10000, height: 400)
                  //  }
                NavigationLink(destination:screen2()) {
                    Text("使用預購程式")
                       .fontWeight(.bold)
                       .font(.title)
                       .padding()
                       .background(Color(red: 196/255, green: 136/255, blue: 139/255))
                       .foregroundColor(.white)
                       .padding(10)
                       .border(Color(red: 196/255, green: 21/255, blue: 139/255), width: 5)
                       .cornerRadius(10)
                    }.offset(x: 0, y: -50)
                            
                       }
                 }
            
              }
            }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
