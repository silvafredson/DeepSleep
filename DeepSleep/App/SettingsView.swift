//
//  SettingsView.swift
//  DeepSleep
//
//  Created by Fredson Silva on 15/04/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            (Utils.SavedColors.bgColor).ignoresSafeArea()
            NavigationView {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 20) {
                        // MARK: - Section 1
                        GroupBox(
                            label:
                                SettingsLabelView(labelText: "teste", labelImage: "Text")
                        ) {
                            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        }
                        
                        // MARK: - Section 2
                        
                        // MARK: - Section 3
                    } // VStack
                    .navigationTitle(Text("Info"))
                    .toolbar {
                        //trailing:
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(systemName: "xmark")
                            }
                            .modifier(Utils.ShadowModifier())
                    } // toolbar
                    .padding()
                } // Scroll
            } // Navi
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            //.preferredColorScheme(.dark)
    }
}
