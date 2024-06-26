//
//  ViewModel.swift
//  DeepSleep
//
//  Created by Fredson Silva on 07/03/23.
//

import AVFoundation
import MediaPlayer

let audiosData: [Audio] = [
    Audio(title: "white Noise", iconName: "White Noise", audioFileName: "White Noise"), // 1
    Audio(title: "pink Noise", iconName: "Pink Noise", audioFileName: "Pink Noise"), // 2
    Audio(title: "nature", iconName: "Nature", audioFileName: "Nature"), // 3
    Audio(title: "running Water", iconName: "Running Water", audioFileName: "Running Water"), // 4
    Audio(title: "fire", iconName: "Fire", audioFileName: "Fire"), // 5
    Audio(title: "airplane Cabin", iconName: "Airplane Cabin", audioFileName: "Airplane Cabin"), // 6
    Audio(title: "rain", iconName: "Rain", audioFileName: "Rain"), // 7
    Audio(title: "waterfall", iconName: "Waterfall", audioFileName: "Waterfall"), // 8
    Audio(title: "uterus", iconName: "Uterus", audioFileName: "Uterus"), // 9
    Audio(title: "forest River", iconName: "Forest River", audioFileName: "Forest River"), // 10
    Audio(title: "ocean", iconName: "Ocean", audioFileName: "Ocean"), // 11
    Audio(title: "rain Wind", iconName: "Rain Wind", audioFileName: "Rain Wind"), // 12
    Audio(title: "tornado", iconName: "Tornado", audioFileName: "Tornado"), // 13
    Audio(title: "windy", iconName: "Windy", audioFileName: "Wind"), // 14
]

class AudioStoreViewModel: ObservableObject {
    
    @Published var audios: [Audio]
    var player: AVAudioPlayer?
    
    init(audios: [Audio]) {
        self.audios = audios
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.allowAirPlay, .allowBluetoothA2DP, .allowBluetooth])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error setting up audio session: \(error.localizedDescription)")
        }
    }
    
    // MARK: -
    /// The toggleIsPlaying(for audio: Audio) method is responsible for toggling the playback state of an Audio object and stopping the playback of any other Audio object that is currently playing.

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
    
    // MARK: - Play audio
    func startPlaying(audio: Audio) {
        
        setupRemoteControl(for: audio)
        setupNowPlaying(for: audio)
        setupRemoteCommandCenter(for: audio)
        
        do {
            guard let audioURL = audio.audioURL else {
                print("Error: audio URL is nil for \(audio.title)")
                return
            }
            player = try AVAudioPlayer(contentsOf: audioURL)
            player?.numberOfLoops = -1
            player?.play()
            
            if let index = audios.firstIndex(of: audio) {
                audios[index].player = player
                audios[index].isPlaying = true
            }
        } catch {
            print("Error starting playback for audio \(audio.title): \(error.localizedDescription)")
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
    
    
    // MARK: - Set up MPNowPlayingInfoCenter
    func setupNowPlaying(for audio: Audio) {
        var nowPlayingInfo = [String : Any]()
        
        nowPlayingInfo[MPMediaItemPropertyTitle] = audio.id
        nowPlayingInfo[MPMediaItemPropertyAlbumTitle] = audio.iconName
        //nowPlayingInfo[MPMediaItemProperty] = "AppIcon"
        
//        if let image = UIImage(named: audios) {
//            nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: image.size) { size in
//                return image
//            }
//        }
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
        MPNowPlayingInfoCenter.default().playbackState = .playing
    }
    
    // MARK: - play/pause lock screen button
    func setupRemoteCommandCenter(for audio: Audio) {
        UIApplication.shared.beginReceivingRemoteControlEvents()
        
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.isEnabled = true
        commandCenter.playCommand.addTarget { (_) -> MPRemoteCommandHandlerStatus in
            print("Should play")
            
            self.player?.play()
            return.success
        }
        
        commandCenter.pauseCommand.isEnabled = true
        commandCenter.pauseCommand.addTarget { (_) ->  MPRemoteCommandHandlerStatus in
            print("Should Pause")
            
            self.player?.pause()
            return.success
        }
    }
    
    // MARK: - testing up PLAY NOW
    func setupRemoteControl(for audio: Audio) {
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
            
            do {
                try AVAudioSession.sharedInstance().setActive(true)
                print("AVAudioSession is Active")
            } catch let error as NSError {
                print(error.localizedDescription)
                
            }
            
        } catch let error {
            print("Erro setting the AVAudioSession: \(error.localizedDescription)")
        }
    }
}
