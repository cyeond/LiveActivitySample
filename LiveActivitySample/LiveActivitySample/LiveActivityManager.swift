//
//  LiveActivityManager.swift
//  LiveActivitySample
//
//  Created by YD on 2023/07/16.
//

import ActivityKit
import Foundation
import SwiftUI
import Combine

class LiveActivityManager {
    static let shared = LiveActivityManager()
    var activity: Activity<LiveActivityAttributes>?
    
    private init() { }
    
    func startActivity(name: String) {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else { return }
        Task {
            do {
                let updatedStatus = LiveActivityAttributes.ContentState(name: name)
                let content = ActivityContent(state: updatedStatus, staleDate: nil)
                let activity = try Activity<LiveActivityAttributes>.request(
                    attributes: LiveActivityAttributes(),
                    content: content
                )
                self.activity = activity
            } catch (let error) {
                print(error)
            }
        }
    }
    
    func stopActivity() {
        Task {
            await activity?.end(nil, dismissalPolicy: .immediate)
            activity = nil
        }
    }
    
    func updateActivity(name: String) {
        Task {
            let updatedStatus = LiveActivityAttributes.ContentState(name: name)
            let content = ActivityContent(state: updatedStatus, staleDate: nil)
            await activity?.update(content)
        }
    }
}

