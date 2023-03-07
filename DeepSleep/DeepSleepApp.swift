//
//  DeepSleepApp.swift
//  DeepSleep
//
//  Created by Fredson Silva on 13/02/23.
//

import SwiftUI

@main
struct DeepSleepApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(audiosContent: audiosData[0])
        }
    }
}
