//
//  board.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import Foundation
import AppKit

// write to clipboard
public func writeToClipboard(string: String) {
    let pb = NSPasteboard.general
    pb.clearContents()
    let result = pb.setString(string, forType:  NSPasteboard.PasteboardType.string)
    if result {
        sendClipSucceedNotification(string: string)
    }
}

// read from clipboard
//func readFromClipboard() -> String {
//    return String()
//}
