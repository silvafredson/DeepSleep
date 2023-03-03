//
//  ButtonView.swift
//  DeepSleep
//
//  Created by Fredson Silva on 22/02/23.
//

import SwiftUI

struct ButtonView: View {
    
    let audiosContent: Audio
    @State var isPressed = false
    
    var body: some View {
        ZStack {
            //(Utils.SavedColors.bgColor).ignoresSafeArea(.all)
            
            let rectangleUp = RectangleButtonView(audiosContent: audiosData[0])
            let InnerRectangle = InnerRectangleButtonView(audiosContent: audiosData[0])

            if isPressed {
                InnerRectangle
            } else {
                rectangleUp
            }

//            Image(systemName: "play.circle.fill")
//                .font(.system(size: 80))
//                .foregroundColor(.white)
//                .opacity(isPressed ? 0.5 : 1.0)
        }
        .onTapGesture {
            isPressed = !isPressed
//            withAnimation(.easeInOut(duration: 0.4)) {
//            }
        }
    } // body
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(audiosContent: audiosData[0])
    }
}
