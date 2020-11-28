//
//  ProgressOverlayView.swift
//  NOProgressBarLayout
//
//  Created by Deo on 2020/11/27.
//  Copyright © 2020 NeetOffice. All rights reserved.
//

import SwiftUI

public struct NOProgressOverlayView: View {
    @ObservedObject private var viewModel:NOProgressBarViewModel
    @Binding private var isShowing:Bool
    private let progressBar:AnyView
    
    public init(_ viewModel:NOProgressBarViewModel){
        self.viewModel = viewModel
        self._isShowing = Binding<Bool>(get: { false }, set: {_ in})
        self.progressBar = AnyView(NOProgressBar())
    }
    
    public init<ProgressBar:View>(_ progressBar:ProgressBar,
                                  viewModel:NOProgressBarViewModel){
        self.viewModel = viewModel
        self._isShowing = Binding<Bool>(get: { false }, set: {_ in})
        self.progressBar = AnyView(progressBar)
    }
    
    public init(_ isShowing:Binding<Bool>){
        self.viewModel = NOProgressBarViewModel()
        self._isShowing = isShowing
        self.progressBar = AnyView(NOProgressBar())
    }
    
    public init<ProgressBar:View>(_ progressBar:ProgressBar,
                                  _ isShowing:Binding<Bool>){
        self.viewModel = NOProgressBarViewModel()
        self._isShowing = isShowing
        self.progressBar = AnyView(progressBar)
    }
    
    public var body: some View {
        ZStack{
            if self.isShowing || self.viewModel.isShowing {
                Color.black.opacity(0.3).edgesIgnoringSafeArea(.all).contentShape(Rectangle()).transition(.opacity)
                self.progressBar.transition(.opacity)
            }
        }
        .animation(.spring())
        .frame(width: self.getScreenWidth(),
               height: self.getScreenHeight())
    }
    
    private func getScreenWidth() -> CGFloat{
        #if os(watchOS)
        return WKInterfaceDevice.current().screenBounds.size.width
        #elseif os(macOS)
        return NSScreen.main.bounds.size.width
        #else
        return UIScreen.main.bounds.width
        #endif
    }
    
    private func getScreenHeight() -> CGFloat{
        #if os(watchOS)
        return WKInterfaceDevice.current().screenBounds.size.height
        #elseif os(macOS)
        return NSScreen.main.bounds.size.height
        #else
        return UIScreen.main.bounds.height
        #endif
    }
}

#if DEBUG
struct NOProgressOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        let progressBarViewModel = NOProgressBarViewModel()
        return //ProgressBarLayout(viewModel: progressBarViewModel){
            Button(action: {
                progressBarViewModel.toggle()
            }, label: {
                Text("Button")
            }).overlay(NOProgressOverlayView(Binding<Bool>(get: { true }, set: {_ in})))
        //}
    }
}
#endif
