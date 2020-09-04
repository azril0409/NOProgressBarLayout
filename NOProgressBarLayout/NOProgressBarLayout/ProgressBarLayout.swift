//
//  NOProgressBarLayout.swift
//  NOProgressBarLayout
//
//  Created by Deo on 2020/9/2.
//  Copyright © 2020 NeetOffice. All rights reserved.
//

import SwiftUI

public struct ProgressBarLayout<Content:View>: View {
    @EnvironmentObject private var viewModel:ProgressBarViewModel
    private let progressBar:AnyView
    private let content:()->Content
    
    public init(@ViewBuilder content:@escaping ()->Content) {
        self.progressBar = AnyView(ProgressBar())
        self.content = content
    }
    
    public init(progressBar:AnyView, @ViewBuilder content:@escaping ()->Content) {
        self.progressBar = progressBar
        self.content = content
    }
    
    public var body: some View {
        ZStack{
            self.content()
            ZStack{
                if self.viewModel.isShowing {
                    Color.black.opacity(0.3).edgesIgnoringSafeArea(.all).contentShape(Rectangle())
                    self.progressBar
                }
            }.animation(.spring())
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#if DEBUG
struct ProgressBarLayout_Previews: PreviewProvider {
    static var previews: some View {
        let progressBarViewModel = ProgressBarViewModel()
        return ProgressBarLayout{
            Button.init(action: {
                progressBarViewModel.show()
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    progressBarViewModel.dismiss()
                }
            }) {Text("Hello, World!")}
        }
        .background(Color.red)
        .environmentObject(progressBarViewModel)
    }
}
#endif
