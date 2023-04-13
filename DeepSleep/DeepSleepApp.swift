//
//  DeepSleepApp.swift
//  DeepSleep
//
//  Created by Fredson Silva on 13/02/23.
//

import SwiftUI

@main
struct DeepSleepApp: App {
    
    @State private var showLaunchView = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            //.transition(.opacity)
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}

