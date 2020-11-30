//
//  LoverEditor.swift
//  LoverApp
//
//  Created by SHIH-YING PAN on 2020/10/28.
//

import SwiftUI

//
//  LoverEditor.swift
//  LoverApp
//
//  Created by SHIH-YING PAN on 2020/10/28.
//

import SwiftUI

struct LoverEditor: View {
var loversData = LoversData()
    @Environment(\.presentationMode) var presentationMode
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        return dateFormatter
    }()
    var editLoverIndex: Int?
   // var loversData: LoversData
    @State private var name = ""
    @State private var nametype = ""
    @State private var weight = 100
    @State private var trueHeart = true
    @State private var truebuy = false
    @State private var selectedIndex = 0
    @State private var date = Date()
    var roles = ["粉類","起司類","奶油類", "餅乾類","生鮮類", "香料類","器具"]
    var body: some View {
        Form {
            TextField("商品名字", text: $name)
            if(roles[selectedIndex]=="粉類"||roles[selectedIndex]=="奶油類"||roles[selectedIndex]=="餅乾類"||roles[selectedIndex]=="生鮮類"||roles[selectedIndex]=="起司類"||roles[selectedIndex]=="香料類")
            {
                Stepper("重量  \(weight)公克", value: $weight, in: 0...10000)
            }
          
            VStack{
            Picker(selection: $selectedIndex, label: Text("\(roles[selectedIndex])")) {
                       ForEach(roles.indices) { (index) in
                          Text(roles[index])
                       }
                   
                        }.pickerStyle(SegmentedPickerStyle())
            }
            Text("購買日期         \(date.description)")
            
            VStack{
                
                          // Text(loveTime.description)
                           DatePicker("", selection: $date, displayedComponents: .date)
                            .labelsHidden()
                               .datePickerStyle(WheelDatePickerStyle())
                
                }
            Toggle("特別注意", isOn: $trueHeart)
            Toggle("是否已經購買", isOn: $truebuy)
            }
        
        .onAppear(perform: {
            if let editLoverIndex = editLoverIndex {
                let editLover = loversData.lovers[editLoverIndex]
                self.name = editLover.name
                self.weight = editLover.weight
                self.trueHeart = editLover.trueHeart
                self.truebuy = editLover.truebuy
                self.nametype=roles[selectedIndex]
            }
        })
        .navigationBarTitle(editLoverIndex == nil ? "新增預購清單" : "編輯預購清單")
        .toolbar(content: {
            ToolbarItem {
                Button("Save") {
                    let lover = Lover(name: self.name, weight:self.weight, trueHeart: trueHeart,truebuy : truebuy,nametype: roles[selectedIndex],date: self.dateFormatter.string(from: self.date),isDone: false)
                    if let editLoverIndex = editLoverIndex {
                        loversData.lovers[editLoverIndex] = lover
                    } else {
                        loversData.lovers.insert(lover, at: 0)

                    }
                    presentationMode.wrappedValue.dismiss()
                }
            }
        })

    }
}

struct LoverEditor_Previews: PreviewProvider {
    static var previews: some View {
        LoverEditor(loversData: LoversData())
    }
}


