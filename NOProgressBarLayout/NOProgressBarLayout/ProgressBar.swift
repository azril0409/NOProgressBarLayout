//
//  NOProgressBar.swift
//  NOProgressBarLayout
//
//  Created by Deo on 2020/9/2.
//  Copyright © 2020 NeetOffice. All rights reserved.
//

import SwiftUI

public struct ProgressBar: View {
    public var stickHeight:CGFloat = 20
    @State var spinCircle = false
    @State private var schedule = 0
    private let count = 12
    
    public var body: some View{
        ZStack{
            ForEach(0..<self.count){ i in
                Capsule().foregroundColor(Color.white).frame(width: self.stickHeight * 0.5, height: self.stickHeight ).offset(y: -self.stickHeight * 1.5).rotationEffect(.degrees(Double(360/self.count*i))).animation(Animation.linear(duration: 1).repeatForever(autoreverses: false)).opacity(self.opacity(i))
            }
        }
        .onReceive(Timer.publish(every: 6.0/60.0, on: .main, in: .default).autoconnect()) { _ in
            let progress = self.schedule + 1
            self.schedule = progress % self.count
        }
    }
    
    private func opacity(_ index:Int)->Double{
        let i  = (index + self.schedule) % self.count
        return Double(i+1)/Double(self.count+1)
    }
}

#if DEBUG
struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
        ProgressBar()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(.all).background(Color.gray)
    }
}
#endif
