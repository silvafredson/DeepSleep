//
//  SettingsLabelView.swift
//  DeepSleep
//
//  Created by Fredson Silva on 15/04/23.
//

import SwiftUI

struct SettingsLabelView: View {
    
    var labelText: String
    var labelImage: String
    
    var body: some View {
        HStack {
            Text("White Noise").fontWeight(.bold)
            Spacer()
            Image(systemName: "info.circle")
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "White Noise", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
