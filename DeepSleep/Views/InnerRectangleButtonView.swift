//
//  InnerRectangleButtonView.swift
//  DeepSleep
//
//  Created by Fredson Silva on 22/02/23.
//

import SwiftUI

struct InnerRectangleButtonView: View {
    
    let audiosContent: Audio
    
    var body: some View {
        
        ZStack {
            Spacer()
            Rectangle()
                .fill(Utils.SavedColors.bgColor)
                .frame(width: 140, height: 140)
                .cornerRadius(10)
                .padding(8)
                .modifier(InnerShadowModifier())
        } 
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

struct InnerRectangleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        InnerRectangleButtonView(audiosContent: audiosData[0])
    }
}
