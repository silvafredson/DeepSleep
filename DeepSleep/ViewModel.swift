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
    Audio(title: "Pink Noise", iconName: "hifispeaker", audioFileName: "Pink Noise"), // 1
    Audio(title: "White Noise", iconName: "wind", audioFileName: "White Noise"), // 2
    Audio(title: "Waterfall", iconName: "drop", audioFileName: "Waterfall"), // 3
    Audio(title: "Forest River", iconName: "figure.water.fitness", audioFileName: "Forest River"), // 4
    Audio(title: "Ocean", iconName: "water.waves", audioFileName: "Ocean"), // 5
    Audio(title: "Running Water", iconName: "humidity", audioFileName: "Running Water"), // 6
    Audio(title: "Airplane Cabin", iconName: "airplane", audioFileName: "Airplane Cabin"), // 7
    Audio(title: "Rain", iconName: "cloud.bolt.rain", audioFileName: "Rain"), // 8
    Audio(title: "uiuwioa", iconName: "beats.powerbeats3", audioFileName: "nove"), // 9
    Audio(title: "opasdedc", iconName: "homepodmini", audioFileName: "dez"), // 10
    Audio(title: "ecrvtb", iconName: "homepod", audioFileName: "onze"), // 11
    Audio(title: "wscfgn", iconName: "homepod", audioFileName: "doze"), // 12
]




