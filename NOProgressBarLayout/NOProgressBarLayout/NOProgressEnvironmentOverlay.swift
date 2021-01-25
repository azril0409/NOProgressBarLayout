//
//  NOProgressEnvironmentOverlay.swift
//  NOProgressBarLayout
//
//  Created by Deo on 2020/11/27.
//  Copyright © 2020 NeetOffice. All rights reserved.
//

import SwiftUI

public struct NOProgressEnvironmentOverlay: View {
    @EnvironmentObject private var viewModel:NOProgressBarViewModel
    private let progressBar:AnyView
    
    public init(){
        self.progressBar = AnyView(NOProgressBar())
    }
    
    public init<ProgressBar:View>(_ progressBar:ProgressBar){
        self.progressBar = AnyView(progressBar)
    }
    
    
    public var body: some View {
        NOProgressOverlayView(self.progressBar, viewModel: viewModel)
    }
}
