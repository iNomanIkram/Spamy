//
//  Global.swift
//  spamy-poc
//
//  Created by Noman Ikram on 21/07/2019.
//  Copyright © 2019 Noman Ikram. All rights reserved.
//

import Foundation

var blockNumberList :[String] = []
var blockKeywordList :[String] = []

var whiteNumberList:[String] = []

var isStart = false;

func saveAll(){
    
    let userDefault = UserDefaults(suiteName: Constant.suiteName)
    
    userDefault?.set(blockNumberList, forKey: Constant.UserDefault.blockNumber)
    userDefault?.set(blockKeywordList, forKey: Constant.UserDefault.blockKeyword)
    userDefault?.set(whiteNumberList, forKey: Constant.UserDefault.whiteNumber)
    userDefault?.set(isStart, forKey: "isStart")
    
}

func saveBlockNumberList(){
    let userDefault = UserDefaults(suiteName: Constant.suiteName)
    userDefault?.set(blockNumberList, forKey: Constant.UserDefault.blockNumber)
}

func saveBlockKeywordList(){
    let userDefault = UserDefaults(suiteName: Constant.suiteName)
    userDefault?.set(blockKeywordList, forKey: Constant.UserDefault.blockKeyword)
}

func saveWhiteNumberList(){
    let userDefault = UserDefaults(suiteName: Constant.suiteName)
    userDefault?.set(whiteNumberList, forKey: Constant.UserDefault.whiteNumber)
}

func saveIsStart(){
    let userDefault = UserDefaults(suiteName: Constant.suiteName)
    userDefault?.set(isStart, forKey: "isStart")
}
