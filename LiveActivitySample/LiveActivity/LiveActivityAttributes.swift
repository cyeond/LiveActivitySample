//
//  LiveActivityAttributes.swift
//  LiveActivityExtension
//
//  Created by YD on 2023/07/17.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LiveActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var title: String
        var time: Date
    }
}
