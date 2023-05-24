//
//  ContentView.swift
//  DeepSleep
//
//  Created by Fredson Silva on 13/02/23.
//

import SwiftUI
import AVFoundation
import UIKit

struct ContentView: View {
    
    @StateObject var audioStored = AudioStoreViewModel(audios: audiosData)
    
    var body: some View {
        
        NavigationView {
            ZStack {
                (Utils.SavedColors.bgColor).ignoresSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 0), GridItem(.flexible())], spacing: 20) {
                            ForEach(audioStored.audios) { audio in
                                ZStack {
                                    if audio.isPlaying {
                                        InnerRectangleButtonView()
                                    } else {
                                        RectangleButtonView()
                                    }
                                    VStack {
                                        Image(audio.iconName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .opacity(audio.isPlaying ? 0.5 : 1.0)
                                            .padding(8)
                                            .modifier(Utils.IconModifier())

                                        Text(LocalizedStringKey(audio.title))
                                            .font(.system(size: 14, weight: .bold, design: .rounded))
                                            .bold()
                                            .foregroundColor(Utils.SavedColors.fontColor)
                                            .opacity(audio.isPlaying ? 0.5 : 1.0)
                                            .padding(4)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.easeOut(duration: 0.4)) {
                                        audioStored.toggleIsPlaying(for: audio)
                                    }
                                }
//                                .onChange(of: audio.isPlaying) { newValue in
//                                    // it Updates the display of the button when the audio playback state changes
//                                    if !newValue {
//                                        audioStored.toggleIsPlaying(for: audio)
//                                    }
//                                }
                            } // ForEach
                        } // VGrig
                        .padding()
                    } // ScrollView
            }// ZStack
            .navigationTitle("DeepSleep")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(Utils.SavedColors.fontColor)
                }
            } // toolbar
        } // Navi
    } // body
}

// MARK: - Modify Navi bar color
extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()

        let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(Utils.SavedColors.bgColor)
            appearance.titleTextAttributes = [
                .foregroundColor: UIColor(Utils.SavedColors.fontColor),
                .font: UIFont.systemFont(ofSize: 30, weight: .semibold)
            ]
            appearance.shadowColor = .white
   
            UINavigationBar.appearance().standardAppearance = appearance
            //UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

struct ContenttView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.environment(\.locale, .init(identifier: "pt-BR"))
    }
}
