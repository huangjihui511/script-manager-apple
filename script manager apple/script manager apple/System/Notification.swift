//
//  Notify.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import Foundation

// send notification
public func sendNotification(string: String) {
        NotificationCenter.default.post(Notification.init(name: Notification.Name("123")))
}

func sendClipSucceedNotification(string: String) {
    sendNotification(string: "copy \(string) successfully")
}
