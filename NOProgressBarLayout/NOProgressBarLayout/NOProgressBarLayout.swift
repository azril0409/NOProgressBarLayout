//
//  NOProgressBarLayout.swift
//  NOProgressBarLayout
//
//  Created by Deo on 2020/9/2.
//  Copyright © 2020 NeetOffice. All rights reserved.
//

import SwiftUI



public struct NOProgressBarLayout<Content:View>: View {
    @EnvironmentObject private var viewModel:NOProgressBarViewModel
    private let progressBar:AnyView
    private let content:()->Content
    
    public init(@ViewBuilder content:@escaping ()->Content) {
        self.progressBar = AnyView(NOProgressBar())
        self.content = content
    }
    
    public init<ProgressBar:View>(progressBar:ProgressBar,
                                  @ViewBuilder content:@escaping ()->Content) {
        self.progressBar = AnyView(progressBar)
        self.content = content
    }
    
    public var body: some View {
        ZStack{
            self.content()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(NOProgressOverlayView(self.progressBar,
                                       viewModel: self.viewModel))
    }
}
