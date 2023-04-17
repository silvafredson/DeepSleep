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
            Text(labelText).fontWeight(.bold)
                .foregroundColor(Utils.SavedColors.fontColor)
            Spacer()
            Image(systemName: labelImage)
                .foregroundColor(Utils.SavedColors.fontColor)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "OI", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
