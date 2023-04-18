//
//  SettingsView.swift
//  DeepSleep
//
//  Created by Fredson Silva on 15/04/23.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        ZStack {
            (Utils.SavedColors.bgColor).ignoresSafeArea()
            //NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 20) {
                        // MARK: - Section 1
                        GroupBox(
                            label:
                                HStack {
                                    Text("What Is White Noise?").fontWeight(.bold)
                                        .foregroundColor(Utils.SavedColors.fontColor)
                                    Spacer()
                                    Image(systemName: "info.circle")
                                        .foregroundColor(Utils.SavedColors.fontColor)
                                }  
                        ) {
                            Divider().padding(.vertical, 4)
                            VStack {
                                VStack {
                                    Text("White noise refers to a noise that contains all frequencies across the spectrum of audible sound in equal measure. Because white noise spans multiple bands of sound, it is sometimes referred to as broadband noise. Anecdotally, people often liken white noise to the static that comes from an untuned radio or television. Researchers have studied the effect of white noise on humans for many years, finding evidence it can reduce crying in infants, improve work performance, and potentially help counteract symptoms of attention deficit hyperactivity disorder (ADHD). Multiple studies have also examined how white noise may affect human sleep.")
                                    
                                }
//                                VStack {
//                                    Text("")
//                                }
                            }
                
                        }
                        .modifier(Utils.InfoShadowModifier())
                        
                        // MARK: - Section 2
                        GroupBox(
                            label:
                                HStack {
                                    Text("About").fontWeight(.bold)
                                        .foregroundColor(Utils.SavedColors.fontColor)
                                    Spacer()
                                    Image(systemName: "iphone")
                                        .foregroundColor(Utils.SavedColors.fontColor)
                                }
                        ) {
                            
                            
                            SettingsRowView(name: "Developer", content: "Fredson Silva")
                            SettingsRowView(name: "Source", linkLabel: "Sleep Foundation", linkDestination: "www.sleepfoundation.org/noise-and-sleep/white-noise#:~:text=Researchers%20have%20studied%20the%20effect,View%20Source%20.")
                            
                        }
                        .modifier(Utils.InfoShadowModifier())
                        
                        // MARK: - Section 3
                    } // VStack
                    .navigationTitle(Text("Info"))
                    .padding()
                } // Scroll
            //} // Navi
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            //.preferredColorScheme(.dark)
    }
}
