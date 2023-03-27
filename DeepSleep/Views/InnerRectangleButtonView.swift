//
//  InnerRectangleButtonView.swift
//  DeepSleep
//
//  Created by Fredson Silva on 22/02/23.
//

import SwiftUI

struct InnerRectangleButtonView: View {
    
    //let audiosContent: Audio
    
    var body: some View {
        
        ZStack {
            Spacer()
            Rectangle()
                .fill(Utils.SavedColors.bgColor)
                .frame(width: 140, height: 140)
                .cornerRadius(10)
                .padding(8)
                .modifier(Utils.InnerShadowModifier())
        } 
    }
}

struct InnerRectangleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        InnerRectangleButtonView()
    }
}
