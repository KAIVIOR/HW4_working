//
//  Lover.swift
//  LoverApp
//
//  Created by SHIH-YING PAN on 2020/10/28.
//

import Foundation


struct Lover: Identifiable {
    let id = UUID()
    var name: String
    var weight: Int
    var trueHeart: Bool
    var truebuy: Bool
    var nametype: String
    var date:String
    var isDone: Bool
}
