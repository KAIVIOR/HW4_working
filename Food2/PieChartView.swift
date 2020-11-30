//
//  PieChartView.swift
//  Food2
//
//  Created by User02 on 2020/11/27.
//

import SwiftUI

struct PieChartView: View {
    var startAngle:[Angle]
    let foodnametype = ["粉類", "奶油類", "餅乾類","生鮮類","器具"]
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ZStack {
            PieChart(startAngle: self.startAngle[0],
                     endAngle: self.startAngle[1])
                .fill(Color.red)
            PieChart(startAngle: self.startAngle[1],
                     endAngle: self.startAngle[2])
                .fill(Color.orange)
            PieChart(startAngle: self.startAngle[2],
                     endAngle: self.startAngle[3])
                .fill(Color.yellow)
            PieChart(startAngle: self.startAngle[3],
                     endAngle: self.startAngle[4])
                .fill(Color.green)
            PieChart(startAngle: self.startAngle[4],
                     endAngle: self.startAngle[5])
                .fill(Color.blue)
        }
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(startAngle: [.degrees(0), .degrees(100), .degrees(100), .degrees(360), .degrees(360)])
            .frame(width: 200, height: 200)
    }
}
struct PieChart: Shape{
    var startAngle: Angle
    var endAngle: Angle
    func path(in rect: CGRect) -> Path {
        Path{(path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
