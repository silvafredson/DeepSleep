//
//  HapictsManager.swift
//  DeepSleep
//
//  Created by Fredson Silva on 28/05/23.
//

import Foundation
import UIKit

fileprivate final class HapticsManager {
    static let shared = HapticsManager()
    private let feedback = UIImpactFeedbackGenerator()
    private init() {}
    
    func trigger(_ vibration: UIImpactFeedbackGenerator) {
        feedback.impactOccurred()
    }
}

func haptics(_ vibration: UIImpactFeedbackGenerator) {
    if UserDefaults.standard.bool(forKey: UserDefaultKeys.hapticsEnabled){
        HapticsManager.shared.trigger(vibration)
    }
}
