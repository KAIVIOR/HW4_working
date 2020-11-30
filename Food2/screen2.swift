//
//  screen2.swift
//  Food2
//
//  Created by User09 on 2020/11/18.
//

import SwiftUI
import UIKit
var view = UIView()
//建立一個畫圓型比例的Function

struct screen2: View {
    @ObservedObject var loversData = LoversData()
    var body: some View {
        
        TabView{
            
            LoverList(loversData: self.loversData)
                .tabItem { Image(systemName:"square.and.pencil")
                Text("預購清單")
                }
            ChartView(loversData: self.loversData)
                .tabItem { Image(systemName:"chart.bar.fill")
                Text("圖表")
                }
            mian2()
                 .tabItem { Image(systemName:"cloud.heavyrain.fill")
                 Text("動圖")
                 }
        }
        
    }
}

struct screen2_Previews: PreviewProvider {
    static var previews: some View {
        screen2()
    }
}
