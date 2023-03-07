//
//  ViewModel.swift
//  DeepSleep
//
//  Created by Fredson Silva on 07/03/23.
//

import Foundation
import AVFoundation

class AudioStore: ObservableObject {
    @Published var audios: [Audio]
    
    init(audios: [Audio]) {
        self.audios = audios
    }
    
    func toggleIsPlaying(for audio: Audio) {
        if let index = audios.firstIndex(of: audio) {
            for i in 0..<audios.count {
                if i == index {
                    audios[i].isPlaying.toggle()
                    if audios[i].isPlaying {
                        startPlaying(audio: audios[i])
                    } else {
                        stopPlaying(audio: audios[i])
                    }
                } else {
                    audios[i].isPlaying = false
                    stopPlaying(audio: audios[i])
                }
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
            player.numberOfLoops = -1
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
    Audio(title: "Pink Noise", iconName: "hifispeaker", audioFileName: "Pink Noise"),
    Audio(title: "White Noise", iconName: "wind", audioFileName: "White Noise"),
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




