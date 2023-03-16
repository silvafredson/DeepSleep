//
//  Utils.swift
//  DeepSleep
//
//  Created by Fredson Silva on 02/03/23.
//

import Foundation
import SwiftUI

struct Utils {
    
    struct SavedColors {
        static let bgColor = Color("bgColor")
        static let fontColor = Color("fontColor")
        static let lightShadow = Color("lightShadow")
        static let darkShadow = Color("darkShadow")
    }
    
    // MARK: - Shadows
    struct ShadowModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .shadow(color: (Utils.SavedColors.lightShadow), radius: 5, x: -8, y: -8)
                .shadow(color: (Utils.SavedColors.darkShadow), radius: 5, x:8, y: 8)
        }
    }
    
    struct IconModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                //.shadow(color: (Utils.SavedColors.lightShadow), radius: 5, x: -8, y: -8)
                .shadow(color: (Utils.SavedColors.darkShadow), radius: 6, x:2, y: 2)
        }
    }
    
    // MARK: - Inner Shadow
    struct InnerShadowModifier: ViewModifier {
        
        @State var radius: CGFloat = 10
        
        func body(content: Content) -> some View {
            content
                .overlay (
                    RoundedRectangle(cornerRadius: radius)
                        .stroke((Utils.SavedColors.bgColor), lineWidth: 5)
                        .shadow(color: (Utils.SavedColors.darkShadow), radius: 3, x: 5, y: 5)
                        .clipShape(RoundedRectangle(cornerRadius: radius))
                        .shadow(color: (Utils.SavedColors.lightShadow), radius: 2, x: -4, y: -4)
                        .clipShape(RoundedRectangle(cornerRadius: radius))
                )
        }
    }
}

