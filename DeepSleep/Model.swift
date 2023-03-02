//
//  Model.swift
//  DeepSleep
//
//  Created by Fredson Silva on 16/02/23.
//

import Foundation
import AVFAudio
import SwiftUI

struct Audio: Identifiable {
    let id = UUID()
    let title: String
    let iconName: String
    let audioURL: URL?
    

    init(title: String, iconName: String, audioFileName: String) {
        self.title = title
        self.iconName = iconName
        if let fileURL = Bundle.main.url(forResource: audioFileName, withExtension: "caf") {
            self.audioURL = fileURL
        } else {
            self.audioURL = nil
            print("Error: Could not find audio file \(audioFileName).caf")
        }
    }
}


let audiosData: [Audio] = [
    Audio(title: "Water", iconName: "hifispeaker", audioFileName: "um"),
    Audio(title: "Windd", iconName: "wind", audioFileName: "dois"),
    Audio(title: "bla", iconName: "airpodsmax", audioFileName: "tres"),
    Audio(title: "bleeee", iconName: "headphones", audioFileName: "quatro"),
    Audio(title: "blz blz", iconName: "earpods", audioFileName: "cinco"),
    Audio(title: "blaz bla", iconName: "airpodspro", audioFileName: "seis"),
    Audio(title: "hajshdasd", iconName: "airpods.gen3", audioFileName: "sete"),
    Audio(title: "euiaosd", iconName: "beats.earphones", audioFileName: "oito"),
    Audio(title: "uiuwioa", iconName: "beats.powerbeats3", audioFileName: "nove"),
    Audio(title: "opasdedc", iconName: "homepodmini", audioFileName: "dez"),
    Audio(title: "ecrvtb", iconName: "homepod", audioFileName: "onze"),
    Audio(title: "wscfgn", iconName: "homepod", audioFileName: "doze"),
]

//enum soundsCases {
//    case um
//    case dois
//    case treis
//    case quatro
//    case cinco
//    case seis
//    case sete
//    case oito
//    case nove
//    case dez
//    case onze
//    case doze
//}
//
//extension soundsCases {
//    
//    var soundsFile: String {
//        
//        switch self {
//            case .um:
//                return "um"
//            case .dois:
//                return "dois"
//            case .treis:
//                return "treis"
//            case .quatro:
//                return "quatro"
//            case .cinco:
//                return "cinco"
//            case .seis:
//                return "seis"
//            case .sete:
//                return "sete"
//            case .oito:
//                return "oito"
//            case .nove:
//                return "nove"
//            case .dez:
//                return "dez"
//            case .onze:
//                return "onze"
//            case .doze:
//                return "doze"
//        }
//    }
//}
