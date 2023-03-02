//
//  PlayerButtonView.swift
//  DeepSleep
//
//  Created by Fredson Silva on 14/02/23.
//

import SwiftUI
import AVKit


struct RectangleButtonView: View {
    
    // MARK: - Porperties
  
    //var sound: ListItem
    
    var body: some View {
        
        ZStack {
            HStack {
                Spacer()
                Rectangle()
                    .fill(Color("bgColor"))
                .frame(width: 150, height: 150)
                Spacer()
                Rectangle()
                    .fill(Color("bgColor"))
                .frame(width: 150, height: 150)
                Spacer()
            }
        }
        
    }
    

}

struct PlayerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleButtonView()
            //.preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
