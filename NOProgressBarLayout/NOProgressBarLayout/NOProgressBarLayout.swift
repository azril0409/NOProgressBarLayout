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

#if DEBUG
struct NOProgressBarLayout_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = NOProgressBarViewModel()
        return NOProgressBarLayout{
            Button(action: {
                viewModel.show()
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    viewModel.dismiss()
                }
            }) {Text("Hello, World!").padding()}
            .background(Color.red)
            .overlay(Image(systemName: "pencil.and.outline"))
            .overlay(Image(systemName: "square.and.arrow.up"))
        }
        .background(Color.yellow)
        .environmentObject(viewModel)
    }
}
#endif
