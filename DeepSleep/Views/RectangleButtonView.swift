//
//  PlayerButtonView.swift
//  DeepSleep
//
//  Created by Fredson Silva on 14/02/23.
//

import SwiftUI

struct RectangleButtonView: View {
    
    let audiosContent: Audio
    
        var body: some View {
        
        ZStack {         
            Rectangle()
                .fill(Utils.SavedColors.bgColor)
                .frame(width: 140, height: 140)
                .cornerRadius(10)
                .padding(8)
                .modifier(ShadowModifier())
        }
    }
}

// MARK: - Shadow
struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: (Utils.SavedColors.lightShadow), radius: 5, x: -8, y: -8)
            .shadow(color: (Utils.SavedColors.darkShadow), radius: 5, x:10, y: 10)
    }
}

struct RectangleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleButtonView(audiosContent: audiosData[0])
    }
}
