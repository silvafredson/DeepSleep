//
//  PlayerButtonView.swift
//  DeepSleep
//
//  Created by Fredson Silva on 14/02/23.
//

import SwiftUI

struct RectangleButtonView: View {
    
    var body: some View {
        
        ZStack {         
            Rectangle()
                .fill(Utils.SavedColors.bgColor)
                .frame(width: 140, height: 140)
                .cornerRadius(10)
                .padding(8)
                .modifier(Utils.ShadowModifier())
        }
    }
}

struct RectangleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleButtonView()
    }
}
