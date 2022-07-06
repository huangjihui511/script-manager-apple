//
//  Date.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import Foundation

//时间戳转成字符串
func timeIntervalChangeToTimeStr(timeInterval:TimeInterval, dateFormat:String?) -> String {
    let date:NSDate = NSDate.init(timeIntervalSince1970: timeInterval/1000)
    let formatter = DateFormatter.init()
    if dateFormat == nil {
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }else{
        formatter.dateFormat = dateFormat
    }
    return formatter.string(from: date as Date)
}
