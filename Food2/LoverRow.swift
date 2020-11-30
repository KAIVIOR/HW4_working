//
//  LoverRow.swift
//  LoverApp
//
//  Created by SHIH-YING PAN on 2020/10/28.
//

import SwiftUI

struct LoverRow: View {
    var lover: Lover
    
    var body: some View {
        HStack {
            VStack{
                
            Text("\(lover.name)-\(lover.nametype)")
                .fontWeight(.heavy)
                .foregroundColor(.blue)
           
            Text(lover.date)
                .fontWeight(.heavy)
                .foregroundColor(.black)          }.background(Color(red: 158/255, green: 218/255, blue: 10/255))
            .cornerRadius(10)
            Spacer()
            if(lover.truebuy==true)
            {
            Text("已經購買")
            .foregroundColor(Color.green)
                .fontWeight(.heavy)
            }
            else
            {
            Text("尚未購買")
            .foregroundColor(Color.red)
                .fontWeight(.heavy)
            }
            if(lover.trueHeart==true)
            {
            Text("\(lover.weight) 公克")
            .foregroundColor(Color.black)
                .fontWeight(.heavy)
            }
            else
            {
            Text("\(lover.weight) 公克")
            .foregroundColor(Color.black)
                .fontWeight(.heavy)
            }
           // Image(systemName: lover.trueHeart ? "star.fill" : "heart")
            if(lover.trueHeart==true)
            {
          Image(systemName: "star.fill")
            }
            else
            {
                Image(systemName: "star.slash.fill")
                
            }
        }
        
    }
    
}

struct LoverRow_Previews: PreviewProvider {
    static var previews: some View {
        LoverRow(lover: Lover(name: "unsalt butter", weight: 45, trueHeart: true,truebuy: false,nametype: "種類",date: "2020/11/11", isDone : false))
            .previewLayout(.sizeThatFits)
            
    }
}
