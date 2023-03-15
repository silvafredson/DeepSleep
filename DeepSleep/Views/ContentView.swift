//
//  ContentView.swift
//  DeepSleep
//
//  Created by Fredson Silva on 13/02/23.
//

import SwiftUI
import UIKit
import AVFoundation

struct ContentView: View {
    
    // MARK: - properties
    let audiosContent: Audio
    let player = AVPlayer()
    
    
    @StateObject var audioStore = AudioStore(audios: audiosData)

    var body: some View {
        NavigationView {
            ZStack {
                
                (Utils.SavedColors.bgColor).ignoresSafeArea(.all)
                
                ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 0), GridItem(.flexible())], spacing: 20) {
                            ForEach(audioStore.audios) { audio in
                                ZStack {
                                    if audio.isPlaying {
                                        InnerRectangleButtonView(audiosContent: audio)
                                    } else {
                                        RectangleButtonView(audiosContent: audio)
                                    }

                                    VStack {
                                        Image(audio.iconName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.brown)
                                            .opacity(audio.isPlaying ? 0.5 : 1.0)
                                            .padding(8)
                                            .modifier(Utils.IconModifier())

                                        Text(audio.title)
                                            .font(.system(size: 14, weight: .bold, design: .rounded))
                                            .bold()
                                            .foregroundColor(Color("fontColor"))
                                            .opacity(audio.isPlaying ? 0.5 : 1.0)
                                            .padding(4)
                                    }
                                    //.frame(height: 30)
                                }
                                .onTapGesture {
                                    withAnimation(.easeOut(duration: 0.5)) {
                                        
                                        audioStore.toggleIsPlaying(for: audio)
                                    }
                                }
                                //.id(audio.id)
                                .onChange(of: audio.isPlaying) { newValue in
                                        // it Updates the display of the button when the audio playback state changes
                                        if !newValue {
                                            audioStore.toggleIsPlaying(for: audio)
                                        }
                                    }
                            } // ForEach
                        } // VGrig
                        .padding()
                    } // ScrollView
                
            }// ZStack
            .navigationTitle("DeepSleep")
            .navigationBarTitleDisplayMode(.inline)
        } // Navi
        //.environmentObject(audioStore)
    } // body
}


// MARK: - Modify the Navi tab bar's color
extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()

        if let appearance = UINavigationBarAppearance().copy() as? UINavigationBarAppearance {
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(Utils.SavedColors.bgColor)
            appearance.titleTextAttributes = [
                .foregroundColor: UIColor.gray,
                .font: UIFont.systemFont(ofSize: 30, weight: .semibold)
            ]
            //appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.yellow] // inútil
            appearance.shadowColor = .white

            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
            
    }
}



struct ContenttView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(audiosContent: audiosData[0])
    }
}
