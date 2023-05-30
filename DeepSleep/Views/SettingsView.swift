//
//  SettingsView.swift
//  DeepSleep
//
//  Created by Fredson Silva on 15/04/23.
//

import SwiftUI
import UIKit

struct SettingsView: View {
    
    //@State var vibrationIsOn = true
    @AppStorage(UserDefaultKeys.hapticsEnabled) private var isHapticsEnabled = true
    
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
                                    Text(LocalizedStringKey("what Is White Noise?")).fontWeight(.bold)
                                        .foregroundColor(Utils.SavedColors.fontColor)
                                    Spacer()
                                    Image(systemName: "waveform.path")
                                        .foregroundColor(Utils.SavedColors.fontColor)
                                }  
                        ) {
                            Divider().padding(.vertical, 4)
                            VStack {
                                VStack {
                                    Text(LocalizedStringKey("white noise refers to a noise that contains all frequencies across the spectrum of audible sound in equal measure. Because white noise spans multiple bands of sound, it is sometimes referred  to as broadband noise. Anecdotally, people often liken white noise to the static that comes from an untuned radio or television. Researchers have studied the effect of white noise on humans for many years, finding evidence it can reduce crying in infants, improve work performance, and potentially help counteract symptoms of attention deficit hyperactivity disorder (ADHD). Multiple studies have also examined how white noise may affect human sleep."))//.multilineTextAlignment(.center)
                                    
                                }
                                
                                // MARK: - White Noise vs. Pink Noise
                                Divider().padding(.vertical, 4)
                                VStack {
                                    
                                    HStack {
                                        Text(LocalizedStringKey("white Noise vs. Pink Noise")).fontWeight(.bold)
                                            .foregroundColor(Utils.SavedColors.fontColor)
                                        Spacer()
                                        Image(systemName: "info.circle")
                                            .foregroundColor(Utils.SavedColors.fontColor)
                                    }
                                    .padding(.vertical, 4)
                                    
                                    Text(LocalizedStringKey("like white noise, pink noise is a broadband sound containing components from across the sound spectrum. Pink noise contains sounds within each octave, but the power of its frequencies decreases by three decibels with each higher octave. As a result, pink noise sounds lower pitched than white noise. Researchers have compared the sound of pink noise to the noise produced by a waterfall. Studies have found that pink noise can enhance deep sleep in older adults and improve cognitive performance."))//.multilineTextAlignment(.center)
                                } // VStack
                                Divider().padding(.vertical, 4)
                                
                                // MARK: - Sounds from Nature
                                HStack {
                                    Text(LocalizedStringKey("sounds From Nature")).fontWeight(.bold)
                                        .foregroundColor(Utils.SavedColors.fontColor)
                                    Spacer()
                                    Image(systemName: "leaf")
                                        .foregroundColor(Utils.SavedColors.fontColor)
                                }
                                .padding(.vertical, 4)
                                
                                VStack {
                                    Text(LocalizedStringKey("a recently published study from Carleton University’s Rachel Buxton, research scientist in the Department of Biology, and researchers from Michigan State University, Colorado State University and the National Park Service analyzed studies on the outcomes of listening to natural sounds and found striking human health benefits. Wolves howling, birds singing, rain falling—natural sounds inspire people and connect them to nature and this new research shows these sounds are also good for our health. The team found people who experienced the sounds of nature felt decreased pain, lower stress, improved mood and enhanced cognitive performance. The sounds of water were most effective at improving positive emotions and health outcomes, while bird sounds combat stress and annoyance."))//.multilineTextAlignment(.center)
                                }
                                
                                // MARK: - Source
                                SettingsRowView(name: "source", linkLabel: "Sleep Foundation", linkDestination: "www.sleepfoundation.org/noise-and-sleep/white-noise#:~:text=Researchers%20have%20studied%20the%20effect,View%20Source%20.")
                                SettingsRowView(name: "source", linkLabel: "Carleton Newsroom", linkDestination: "newsroom.carleton.ca/2021/want-to-improve-your-health-a-new-study-says-head-into-nature-and-absorb-the-sounds/")
                            }                
                        }
                        //.modifier(Utils.InfoShadowModifier())
                        
                        // MARK: - Section 2
                        GroupBox(
                            label:
                                HStack {
                                    Toggle(LocalizedStringKey("haptic Feedback"), isOn: $isHapticsEnabled)
                                        .foregroundColor(Utils.SavedColors.fontColor)
                                        .toggleStyle(SwitchToggleStyle(tint: Utils.SavedColors.fontColor))
                                }
                        ) {
                            
                        }
                        
                        // MARK: - Section 3
                        GroupBox(
                            label:
                                HStack {
                                    Text(LocalizedStringKey("about")).fontWeight(.bold)
                                        .foregroundColor(Utils.SavedColors.fontColor)
                                    Spacer()
                                    Image(systemName: "iphone")
                                        .foregroundColor(Utils.SavedColors.fontColor)
                                }
                        ) {
                            
                            
                            SettingsRowView(name: "developer", linkLabel: "Fredson Silva", linkDestination: "www.linkedin.com/in/silvafredson/")
                            
                            //SettingsRowView(name: "version", content: appVersion)
                            
                        }
                        //.modifier(Utils.InfoShadowModifier())
                        
                    } // VStack
                    .navigationTitle(Text("Info"))
                    .padding()
                } // Scroll
            //} // Navi
            
        }
    }
}
// MARK: - To get App version
//extension UIApplication {
//    static var appVersion: String? {
//        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
//    }
//}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            //.preferredColorScheme(.light)
            //.environment(\.locale, .init(identifier: "pt-BR"))
    }
}
