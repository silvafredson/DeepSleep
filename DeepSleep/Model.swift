//
//  Model.swift
//  DeepSleep
//
//  Created by Fredson Silva on 16/02/23.
//

import Foundation
import AVFoundation

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
        
        
        

        
        
        
//        func setUpAVPlayer(audio: Audio) {
//            let fileURL = Bundle.main.path(forResource: audioFileName, ofType:"caf")!
//            let audioURL = URL(fileURLWithPath: fileURL)
//            playerItem = AVPlayerItem(url: audioURL)
//            player = AVAudioPlayer()
//            //setupAudioSession()
//        }
        
    }
    
//    mutating func setUpAVPlayer() {
//        let fileURL = Bundle.main.path(forResource: iconName, ofType:"caf")!
//        let audioURL = URL(fileURLWithPath: fileURL)
//        playerItem = AVPlayerItem(url: audioURL)
//        player = AVAudioPlayer()
//        //setupAudioSession()
//    }
    
}


