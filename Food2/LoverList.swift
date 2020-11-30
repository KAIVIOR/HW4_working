//
//  LoverList.swift
//  LoverApp
//
//  Created by SHIH-YING PAN on 2020/10/28.
//

import SwiftUI

struct LoverList: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var loversData = LoversData()
    @State private var showEditLover = false
    @State private var searchText = ""
    var body: some View {

        NavigationView {
            List {
                SearchBar(text: $searchText);                ForEach(loversData.lovers.indices, id: \.self) { (index) in
                    
                    NavigationLink(
                        destination: LoverEditor( loversData: self.loversData, editLoverIndex: index),
                        label: {
                            LoverRow(lover: self.loversData.lovers[index])
                        })
                    
                }
                .onMove { (indexSet, index) in
                    self.loversData.lovers.move(fromOffsets: indexSet,
                                    toOffset: index)
                }
                .onDelete(perform: { indexSet in
                    self.loversData.lovers.remove(atOffsets: indexSet)
                })
            }
          
            .navigationTitle("預購清單")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.showEditLover = true
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                        
                    })
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            })
            .sheet(isPresented: self.$showEditLover, content: {
                NavigationView {
                    LoverEditor(loversData: loversData)
                }
            })
        }
      
        
    }
}

struct LoverList_Previews: PreviewProvider {
    static var previews: some View {
        LoverList()
    }
}
