//
//  Model.swift
//  DeepSleep
//
//  Created by Fredson Silva on 16/02/23.
//

import Foundation
import AVFoundation
//import SwiftUI

struct Audio: Identifiable, Equatable {
    var id = UUID()
    var title: String
    var iconName: String
    var audioURL: URL?
    var isPlaying = false
    var player: AVAudioPlayer?
    
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

class AudioStore: ObservableObject {
    @Published var audios: [Audio]
    
    init(audios: [Audio]) {
        self.audios = audios
    }
    
    func toggleIsPlaying(for audio: Audio) {
        if let index = audios.firstIndex(of: audio) {
            audios[index].isPlaying.toggle()
            if audios[index].isPlaying {
                startPlaying(audio: audios[index])
            } else {
                stopPlaying(audio: audios[index])
            }
        }
    }

    func setIsPlaying(for audio: Audio) {
        if let index = audios.firstIndex(of: audio) {
            for i in 0..<audios.count {
                if i != index {
                    audios[i].isPlaying = false
                    stopPlaying(audio: audios[i])
                }
            }
            audios[index].isPlaying = true
            startPlaying(audio: audios[index])
        }
    }

    
    func startPlaying(audio: Audio) {
        do {
            let player = try AVAudioPlayer(contentsOf: audio.audioURL!)
            player.play()
            if let index = audios.firstIndex(of: audio) {
                audios[index].player = player
                audios[index].isPlaying = true
            }
        } catch {
            print("Error starting playback for audio \(audio.title): \(error.localizedDescription)")
        }
    }

    func stopPlaying(audio: Audio) {
        if let index = audios.firstIndex(of: audio) {
            audios[index].player?.stop()
            audios[index].player = nil
            audios[index].isPlaying = false
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


//struct Audio: Identifiable, Equatable {
//    var id = UUID()
//    var title: String
//    var iconName: String
//    var audioURL: URL?
//    var isPlaying = false
//
//
//    init(title: String, iconName: String, audioFileName: String) {
//        self.title = title
//        self.iconName = iconName
//        if let fileURL = Bundle.main.url(forResource: audioFileName, withExtension: "caf") {
//            self.audioURL = fileURL
//        } else {
//            self.audioURL = nil
//            print("Error: Could not find audio file \(audioFileName).caf")
//        }
//    }
//}






//class AudioStore: ObservableObject {
//    @Published var audios = audiosData
//    @Published var currentAudio: Audio?
//    @Published var isPlaying = false
//
//    func toggleIsPlaying() {
//        isPlaying.toggle()
//    }
//
//    func setIsPlaying(for audio: Audio) {
//        for i in 0..<audios.count {
//            audios[i].isPlaying = audios[i].id == audio.id
//        }
//    }
//}


