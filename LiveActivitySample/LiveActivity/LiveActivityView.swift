//
//  LiveActivityView.swift
//  LiveActivityExtension
//
//  Created by YD on 2023/07/17.
//

import SwiftUI

struct LiveActivityView: View {
    @State var state: LiveActivityAttributes.ContentState

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(state.title)
                    .foregroundColor(.white)
                    .frame(width: 100.0, height: 20.0, alignment: .leading)
                    .padding(.top, 20.0)
                
                Spacer()
                
                Text(state.time, style: .timer)
                    .foregroundColor(.white)
                    .frame(width: 100.0, height: 20.0)
                    .padding(.bottom, 20.0)
            }
            .frame(height: 50.0)
            .padding(.leading, 20.0)
            
            Spacer()
            
            Image(systemName: "gear")
                .resizable()
                .frame(width: 60.0, height: 60.0)
                .cornerRadius(15.0)
                .padding(.trailing, 20.0)
        }
        .frame(height: 100.0)
        .activityBackgroundTint(Color.gray)
        .activitySystemActionForegroundColor(Color.white)
    }
}
