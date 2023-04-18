//
//  LaunchView.swift
//  DeepSleep
//
//  Created by Fredson Silva on 12/04/23.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var loadingText = "DeepSleep"
    @State private var isImageAnimated = false
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack {
            (Utils.SavedColors.bgColor).ignoresSafeArea()
            
                ZStack {
                    if isImageAnimated {
                        ZStack {
                            Image("LaunchScreen")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                            
                            ZStack {
                                Text(loadingText)
                                    .font(.system(size: 30, weight: .bold, design: .rounded))
                                    .bold()
                                    .foregroundColor(Utils.SavedColors.fontColor)
                                    .padding(4)
                            }
                            .offset(y: 100)
                        }
                    }
                }
                .onAppear {
                    withAnimation(.easeOut(duration: 1)) {
                        showLaunchView = false
                        //isImageAnimated.toggle()
                    }
                }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}
