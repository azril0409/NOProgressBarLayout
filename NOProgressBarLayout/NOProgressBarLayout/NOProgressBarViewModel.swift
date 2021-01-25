//
//  ProgressBarViewModel.swift
//  NOProgressBarLayout
//
//  Created by Deo on 2020/9/3.
//  Copyright © 2020 NeetOffice. All rights reserved.
//

import SwiftUI

public class NOProgressBarViewModel:ObservableObject {
    @Published var isShowing = false
    private var count:Int = 0
    
    public init(){}
    
    public func show(){
        self.count += 1
        DispatchQueue.main.async {
            self.isShowing = self.count > 0
        }
    }
    
    public func dismiss(){
        self.count -= 1
        if self.count < 0 {
            self.count = 0
        }
        DispatchQueue.main.async {
            self.isShowing = self.count > 0
        }
    }
    
    public func toggle(){
        DispatchQueue.main.async {
            self.isShowing.toggle()
        }
    }
}
