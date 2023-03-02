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
    let allAudios: Audio
    let player = AVPlayer()
    @State var buttonPressed = false

    var body: some View {
        
        NavigationView {
            ZStack {
                Color("bgColor").ignoresSafeArea(.all)
                ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 0), GridItem(.flexible())], spacing: 20) {
                            ForEach(audiosData) { audio in
                                
                                    Button(action: {
                                        guard let audioURL = audio.audioURL else { return }
                                        let playerItem = AVPlayerItem(url: audioURL)
                                        player.replaceCurrentItem(with: playerItem)
                                        
                                        
                                            
                                        if !buttonPressed {
                                            player.play()
                                        } else {
                                            player.pause()
                                        }
                                    }) {
           
                                        ButtonView(audiosContent: audio)
                                    } // button
                                    .onTapGesture {
                                        player.play() //testar
                                       // withAnimation(.easeInOut(duration: 0.4)) { }
                                    }
                                    .id(audio.id)
                            } // ForEach
                        } // VGrig
                        .padding()
                    
                    } // ScrollView
                
            }// ZStack
            .navigationTitle("Deep Sleep")
            .navigationBarTitleDisplayMode(.inline)
        } // Navi
    }
}

// MARK: - Modify the Navi tab bar's color
extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()

        if let appearance = UINavigationBarAppearance().copy() as? UINavigationBarAppearance {
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(named: "bgColor")
            appearance.titleTextAttributes = [.foregroundColor: UIColor.gray]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black] // inútil
            appearance.shadowColor = .white

            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }

    }
}


struct ContenttView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(allAudios: audiosData[0])
    }
}
