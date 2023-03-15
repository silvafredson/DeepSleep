//
//  ViewModel.swift
//  DeepSleep
//
//  Created by Fredson Silva on 07/03/23.
//

import Foundation
import AVFoundation
import MediaPlayer

let audiosData: [Audio] = [
    Audio(title: "Nature", iconName: "Nature", audioFileName: "Nature"), // 1
    Audio(title: "Running Water", iconName: "Running Water", audioFileName: "Running Water"), // 2
    Audio(title: "Pink Noise", iconName: "Pink Noise", audioFileName: "Pink Noise"), // 3
    Audio(title: "White Noise", iconName: "White Noise", audioFileName: "White Noise"), // 4
    Audio(title: "Waterfall", iconName: "Waterfall", audioFileName: "Waterfall"), // 5
    Audio(title: "Forest River", iconName: "", audioFileName: "Forest River"), // 6
    Audio(title: "Ocean", iconName: "", audioFileName: "Ocean"), // 7
    Audio(title: "Airplane Cabin", iconName: "", audioFileName: "Airplane Cabin"), // 8
    Audio(title: "Rain", iconName: "Rain", audioFileName: "Rain"), // 9
    Audio(title: "Rain Wind", iconName: "Rain Wind", audioFileName: "Rain Wind"), // 10
    Audio(title: "ecrvtb", iconName: "", audioFileName: "onze"), // 11
    Audio(title: "wscfgn", iconName: "", audioFileName: "doze"), // 12
]

class AudioStore: ObservableObject {
    @Published var audios: [Audio]
    
    let player = AVPlayer()
    
    //var playerItem: AVPlayerItem!

    
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
    
    // MARK: - Play audio Method
    func startPlaying(audio: Audio) {
        
        setupRemoteControl()
        setupNowPlaying()
        setupRemoteCommandCenter()
        
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
        //UIApplication.shared.beginReceivingRemoteControlEvents().self.becomeFirstResponder()
        
    }
    
    func setupNowPlaying() {
        var nowPlayingInfo = [String : Any]()
        nowPlayingInfo[MPMediaItemPropertyTitle] = "Teste"
        //nowPlayingInfo[MPMediaItemPropertyArtwork] = playerItem.
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
        MPNowPlayingInfoCenter.default().playbackState = .playing
    }
    
    // MARK: - play/pause lock screen button
    func setupRemoteCommandCenter() {
        
        
        let commandCenter = MPRemoteCommandCenter.shared();
        commandCenter.playCommand.isEnabled = true
        commandCenter.playCommand.addTarget { event in
            self.player.play()
            return .success
        }
        commandCenter.pauseCommand.isEnabled = true
        commandCenter.pauseCommand.addTarget { event in
            self.player.pause()
            return .success
        }
    }
    
    // MARK: - testing up PLAY NOW
    func setupRemoteControl() {
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)// plays audio when lock creen
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Erro setting the AVAudioSession: \(error.localizedDescription)")//
        }
        
        UIApplication.shared.beginReceivingRemoteControlEvents()
        
        MPRemoteCommandCenter.shared().playCommand.isEnabled = true
        MPRemoteCommandCenter.shared().playCommand.addTarget { (_) -> MPRemoteCommandHandlerStatus in
            print("Should play audio...")
            
            return .success
        }
    }
    
    // MARK: - Stop audio
    func stopPlaying(audio: Audio) {
        if let index = audios.firstIndex(of: audio) {
            audios[index].player?.stop()
            audios[index].player = nil
            audios[index].isPlaying = false
        }
    }
}
