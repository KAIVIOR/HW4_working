//
//  ChartView.swift
//  Food2
//
//  Created by User02 on 2020/11/27.
//

import SwiftUI
struct BarChart: View
{
    var barHeights: [Double]
    var body: some View
    {
        HStack(spacing: 10)
        {
            Bar(barHeights: self.barHeights[0], info: "粉類")
            Bar(barHeights: self.barHeights[1], info: "奶油類")
            Bar(barHeights: self.barHeights[2], info: "起司類")
            Bar(barHeights: self.barHeights[3], info: "餅乾類")
            Bar(barHeights: self.barHeights[4], info: "生鮮類")
            Bar(barHeights: self.barHeights[5], info: "香料類")
            Bar(barHeights: self.barHeights[6], info: "器具")
        }
        .frame(height: 270)
    }
}
struct Bar: View
{
    var barHeights: Double
    @State private var height: CGFloat = 0
    var info: String
    var body: some View
    {
        VStack
        {
            ZStack(alignment: .bottom)
            {
                Capsule().frame(width: 30, height: 250)
                    .foregroundColor(Color(hue: 0.155, saturation: 1.0, brightness: 1.0))
                Capsule().frame(width: 30, height: height)
                    .foregroundColor(Color.orange)
                .animation(.linear(duration:  1))
                .onAppear
                {
                    self.height =  CGFloat(self.barHeights)
                }
            }
            Text(info)
            .frame(height: 22)
                .padding(.top, 4)
        }
    }
}
struct ChartView: View {
    @ObservedObject var loversData = LoversData()
    var index: Double = 0
    var done: Double = 0
//每個職業總共有幾個
    var usefulSum: [Double] = [0, 0, 0, 0, 0, 0, 0]
    var angles = [Angle]()
    var rate: Double = 0
    var count: Double = 0
    var count1: Double = 0
    var startDegree: Double = 0
    var sum: Double = 0
    @State private var selectChart: String = "圓餅圖"
    @State private var trimEnd: CGFloat = 0
    let nametype1 = ["粉類", "奶油類","起司類", "餅乾類","生鮮類","香料類", "器具"]
    let chart = [ "長條圖","圓餅圖"]
    var Percentage: [Double] = [0, 0,0, 0, 0, 0, 0]
    var Percentage1: [Double] = [0, 0, 0, 0, 0,0,0]
    var usefulPercentagePresent: [Double] = [0, 0, 0, 0, 0,0,0] //顯示在圓餅圖的百分比
    var nametypeSum: [Double] = [0, 0, 0, 0, 0, 0, 0]
    var usefulPercentage: [Double] = [0, 0, 0, 0, 0, 0, 0]
    init(loversData: LoversData){
        for index in loversData.lovers{
        sum += 1
          
            if index.nametype=="粉類"{
                nametypeSum[0] += 1
            }else if index.nametype == "奶油類"{
                nametypeSum[1] += 1
            }else if index.nametype == "起司類"{
                nametypeSum[2] += 1
            }else if index.nametype == "餅乾類"{
                nametypeSum[3] += 1
            }else if index.nametype == "生鮮類"{
                nametypeSum[4] += 1
            }else if index.nametype == "香料類"{
                nametypeSum[5] += 1
            }else if index.nametype == "器具"{
                nametypeSum[6] += 1
            }
        }
       var startDegree: Double = 0
   
        for i in 0..<7 {
            count += nametypeSum[i]
        }
        for i in 0..<7{
            Percentage[i] = Double(self.nametypeSum[i]*30 )
        }
        
        count1 = 100/count
        for i in 0..<7{
                  usefulPercentagePresent[i] = Double(self.nametypeSum[i] * count1 )
              }
        for i in 0..<7 {
            Percentage1[ i] = Double(self.usefulPercentage[i]  )
        }
//        for i in 0..<7{
//            usefulPercentage[i] = Double(self.nametypeSum[i] * (360/count))
//        }
      
        for percentage in usefulPercentagePresent{
            angles.append(.degrees(startDegree))
            startDegree += percentage*3.6
        }
       
    }
   // rate = done / index
    var body: some View {
        NavigationView{
            VStack{
                Picker(selection: self.$selectChart, label: Text("請選擇項目：")) {
                    ForEach(self.chart, id: \.self) {(text) in
                        Text(text)
                    }
                    
                }
                .labelsHidden()
                .pickerStyle(SegmentedPickerStyle())
                .padding(20)
           
                  if self.selectChart == "長條圖" {
                        if sum == 0{
                VStack{
                    Image("cake")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .clipped()
                    Text("還沒有新增預購清單！！！")
                    Text("趕快去添加吧")
                    Spacer()
                }
            }else{
                        VStack{
                            Spacer()
                            BarChart(barHeights: Percentage)

                            Spacer()
                        }
                    }
                }
                  else if self.selectChart=="圓餅圖"{
                    if sum == 0{
                        VStack{
                            Image("cake-1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                            .clipped()
                            Text("還沒有新增預購清單！！！")
                            Text("趕快去添加吧")
                            Spacer()
                        }
                    }else{
                        VStack{
                            Spacer()
                            PieChartView1(angles: angles)
                                .frame(width: 200, height: 200)
                            Spacer()
                            HStack{
                         
                                    Color.yellow.frame(width: 15, height: 15)
                                    Text("粉類: \(usefulPercentagePresent[0], specifier: "%.1f")%")
                                    Color.gray.frame(width: 15, height: 15)
                                    Text("奶油類: \(usefulPercentagePresent[1], specifier: "%.1f")%")
                                Color.green.frame(width: 15, height: 15)
                                Text("起司類: \(usefulPercentagePresent[2], specifier: "%.1f")%")
                                
                            }
                            HStack{
                               
                                Color.blue.frame(width: 15, height: 15)
                                Text("餅乾類: \(usefulPercentagePresent[3], specifier: "%.1f")%")
                                Color.red.frame(width: 15, height: 15)
                                Text("生菜類: \(usefulPercentagePresent[4], specifier: "%.1f")%")
                                Color.orange.frame(width: 15, height: 15)
                                Text("香料類: \(usefulPercentagePresent[5], specifier: "%.1f")%")
                                
                            }
                            HStack{
                                Color.purple.frame(width: 15, height: 15)
                                Text("器具: \(usefulPercentagePresent[6], specifier: "%.1f")%")
                            }
                            Spacer()
                        }
                   // }//else
                    
                }//if
            }
            }
        }
    }
}
struct PieChartView1: View {
    var angles: [Angle]
    @State private var trimEnd: CGFloat = 0
    var body: some View{
        ZStack{
            PieChart1(startAngle: self.angles[0], endAngle: self.angles[1])               .fill(Color.yellow)
                
            PieChart1(startAngle: self.angles[1], endAngle: self.angles[2])
                .fill(Color.gray)
            PieChart1(startAngle: self.angles[2], endAngle: self.angles[3])
                  .fill(Color.green)
            PieChart1(startAngle: self.angles[3], endAngle: self.angles[4])
                .fill(Color.blue)
            PieChart1(startAngle: self.angles[4], endAngle: self.angles[5])
                .fill(Color.red)
            PieChart1(startAngle: self.angles[5], endAngle: self.angles[6])
                .fill(Color.orange)
            PieChart1(startAngle: self.angles[6], endAngle: .zero)
                .fill(Color.purple)
           
        }
    }
}

struct PieChart1: Shape{
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        Path{(path) in
            let center = CGPoint(x: rect.midX, y:rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(loversData: LoversData())
    }
}
