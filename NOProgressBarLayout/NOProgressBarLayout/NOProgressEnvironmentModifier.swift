//
//  NOProgressEnvironmentModifier.swift
//  NOProgressBarLayout
//
//  Created by Deo on 2020/11/27.
//  Copyright © 2020 NeetOffice. All rights reserved.
//

import SwiftUI

public struct NOProgressEnvironmentModifier: ViewModifier {
    @EnvironmentObject private var viewModel:NOProgressBarViewModel
    private let progressBar:AnyView
    
    public init(){
        self.progressBar = AnyView(NOProgressBar())
    }
    
    public init<ProgressBar:View>(_ progressBar:ProgressBar){
        self.progressBar = AnyView(progressBar)
    }
    
    public func body(content: Content) -> some View {
        content.overlay(NOProgressOverlayView(self.progressBar,
                                              viewModel: self.viewModel))
    }
}
