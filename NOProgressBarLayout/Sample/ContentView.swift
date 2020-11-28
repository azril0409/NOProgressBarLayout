//
//  ContentView.swift
//  Sample
//
//  Created by Deo on 2020/11/27.
//  Copyright © 2020 NeetOffice. All rights reserved.
//

import SwiftUI
import NOProgressBarLayout

struct ContentView: View {
    @EnvironmentObject var progressBarViewModel:NOProgressBarViewModel
    @State private var isShowing = false
    
    var body: some View {
        VStack{
            Button(action: {
                self.progressBarViewModel.show()
                self.isShowing = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.progressBarViewModel.dismiss()
                    self.isShowing = false
                }
            }, label: {
                Text("Hello, world!")
                    .padding()
            })
            .modifier(NOProgressEnvironmentModifier())
            //.overlay(NOProgressEnvironmentOverlay())
            //.modifier(NOProgressModifier(self.progressBarViewModel))
            //.modifier(NOProgressModifier(self.$isShowing))
            Spacer()
        }
        //.modifier(NOProgressEnvironmentModifier())
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(NOProgressBarViewModel())
    }
}
#endif
