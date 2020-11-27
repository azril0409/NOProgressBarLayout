//
//  NOProgressModifier.swift
//  NOProgressBarLayout
//
//  Created by Deo on 2020/11/27.
//  Copyright © 2020 NeetOffice. All rights reserved.
//

import SwiftUI



public struct NOProgressModifier:ViewModifier{
    private var viewModel:NOProgressBarViewModel?
    private var isShowing:Binding<Bool>
    private let progressBar:AnyView
    
    public init(_ viewModel:NOProgressBarViewModel){
        self.viewModel = viewModel
        self.isShowing = Binding<Bool>(get: { false }, set: {_ in})
        self.progressBar = AnyView(NOProgressBar())
    }
    
    public init<ProgressBar:View>(_ progressBar:ProgressBar,
                                  viewModel:NOProgressBarViewModel){
        self.viewModel = viewModel
        self.isShowing = Binding<Bool>(get: { false }, set: {_ in})
        self.progressBar = AnyView(progressBar)
    }
    
    public init(_ isShowing:Binding<Bool>){
        self.viewModel = nil
        self.isShowing = isShowing
        self.progressBar = AnyView(NOProgressBar())
    }
    
    public init<ProgressBar:View>(_ progressBar:ProgressBar,
                                  _ isShowing:Binding<Bool>){
        self.viewModel = NOProgressBarViewModel()
        self.isShowing = isShowing
        self.progressBar = AnyView(progressBar)
    }
    
    public func body(content: Content) -> some View {
        if let viewModel = self.viewModel {
            return content.overlay(NOProgressOverlayView(self.progressBar, viewModel: viewModel))
        }else {
            return content.overlay(NOProgressOverlayView(self.progressBar, self.isShowing))
        }
    }
}
