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

#if DEBUG
struct NOProgressEnvironmentOverlay_Previews: PreviewProvider {
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
        .overlay(NOProgressEnvironmentOverlay())
        .environmentObject(viewModel)
    }
}
#endif
