//
//  mian2.swift
//  Food2
//
//  Created by User03 on 2020/11/19.
//

import SwiftUI
import UIKit
struct mian2: View {
    @State private var trimEnd: CGFloat = 0
    @Environment(\.presentationMode) var presentationMode
    @StateObject var loversData = LoversData()
    @State private var showEditLover = false
    

    var body: some View {

        NavigationView{

        ZStack{
            Circle()
                .trim(from: 0, to: trimEnd)
                 .stroke(Color( red: 51/255, green: 151/255, blue: 83/255), style: StrokeStyle(lineWidth: 20,
                                                                                dash:[15]))
                 .frame(width: 200, height: 200)
                 .animation(.linear(duration: 3))
                 .onAppear {
                    trimEnd = 1
                
                 }
            Circle()
                .trim(from: 0, to: trimEnd)
                 .stroke(Color.blue, style: StrokeStyle(lineWidth: 10,
lineCap: .round))
                 .frame(width: 200, height: 200)
                 .animation(.linear(duration: 3))
                 .onAppear {
                 trimEnd = 0.25
                
                 }
            Circle()
                .trim(from: 0.25, to: trimEnd)
                 .stroke(Color.orange, style: StrokeStyle(lineWidth: 10,
                                                          dash:[15]))
                 .frame(width: 200, height: 200)
                 .animation(.linear(duration: 3))
                 .onAppear {
                 trimEnd = 0.75
                
                 }
            Circle()
                .trim(from: 0.5, to: trimEnd)
                 .stroke(Color.yellow, style: StrokeStyle(lineWidth: 10,
                lineCap: .round))
                 .frame(width: 200, height: 200)
                 .animation(.linear(duration: 3))
                 .onAppear {
                    trimEnd = 0.75
                
                 }
            Circle()
                .trim(from: 0.75, to: trimEnd)
                 .stroke(Color.red, style: StrokeStyle(lineWidth: 10,
                lineCap: .round))
                 .frame(width: 200, height: 200)
                 .animation(.linear(duration: 3))
                 .onAppear {
                    trimEnd = 0.65
                
                 }

                ForEach(loversData.lovers.indices, id: \.self) { (index) in
                    
                    NavigationLink(
                        destination: LoverEditor( loversData: loversData, editLoverIndex: index),
                        label: {
                            LoverRow(lover: loversData.lovers[index])
                        })
                    
                }
                .onDelete(perform: { indexSet in
                    loversData.lovers.remove(atOffsets: indexSet)
                })
                
            } .navigationTitle("會動的原餅圖")
            
        }
    }
}

struct mian2_Previews: PreviewProvider {
    static var previews: some View {
        mian2()
    }
}
