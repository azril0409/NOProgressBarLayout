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
    
    var body: some View {
        VStack{
            Button(action: {
                self.progressBarViewModel.show()
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.progressBarViewModel.show()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                    self.progressBarViewModel.dismiss()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
                    self.progressBarViewModel.dismiss()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
                    self.progressBarViewModel.dismiss()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                    self.progressBarViewModel.show()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 18) {
                    self.progressBarViewModel.dismiss()
                }
            }, label: {
                Text("Hello, world!")
                    .padding()
            })
        }
        .modifier(NOProgressEnvironmentModifier())
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(NOProgressBarViewModel())
    }
}
#endif
