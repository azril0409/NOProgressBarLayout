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

#if DEBUG
struct NOProgressEnvironmentModifier_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = NOProgressBarViewModel()
        return Button(action: {
            viewModel.show()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                viewModel.dismiss()
            }
        }, label: {
            Text("Button")
        })
        .modifier(NOProgressEnvironmentModifier())
        .environmentObject(viewModel)
    }
}
#endif
