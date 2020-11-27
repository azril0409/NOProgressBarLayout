//
//  SampleApp.swift
//  Sample
//
//  Created by Deo on 2020/11/27.
//  Copyright © 2020 NeetOffice. All rights reserved.
//

import SwiftUI
import NOProgressBarLayout

@main
struct SampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(NOProgressBarViewModel())
        }
    }
}
