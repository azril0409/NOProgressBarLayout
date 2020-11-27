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
    
    public init(){}
    
    public func show(){
        DispatchQueue.main.async {
            self.isShowing = true
        }
    }
    
    public func dismiss(){
        DispatchQueue.main.async {
            self.isShowing = false
        }
    }
    
    public func toggle(){
        DispatchQueue.main.async {
            self.isShowing.toggle()
        }
    }
}
