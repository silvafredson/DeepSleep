//
//  SettingsRowView.swift
//  DeepSleep
//
//  Created by Fredson Silva on 17/04/23.
//

import SwiftUI

struct SettingsRowView: View {
    
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(name).foregroundColor(.gray)
                Spacer()
                if (content != nil) {
                    Text(content ?? "")
                } else if (linkLabel != nil && linkDestination != nil) {
                    Link(linkLabel ?? "", destination: URL(string: "https://\(linkDestination!)")!).foregroundColor(.black)
                    Image(systemName: "arrow.up.right.square").foregroundColor(Utils.SavedColors.fontColor)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "Developer", content: "Fredson Silva")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            SettingsRowView(name: "Source", linkLabel: "Sleep Foundation", linkDestination: "www.sleepfoundation.org/noise-and-sleep/white-noise#:~:text=Researchers%20have%20studied%20the%20effect,View%20Source%20.")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
