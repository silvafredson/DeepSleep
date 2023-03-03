//
//  PlayAudio.swift
//  DeepSleep
//
//  Created by Fredson Silva on 24/02/23.
//

import AVFoundation


//func playAudio(audio: Audio) {
//    guard let audioURL = Bundle.main.url(forResource: audioFileName, withExtension: "mp3") else {
//        print("Invalid audio URL for audio", title)
//        return
//    }
//
//    do {
//        let audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
//
//        print("Audio player loaded for audio \(audio.title)")
//        print("Audio URL:", audioURL)
//
//        audioPlayer.play()
//    } catch {
//        print("Error initializing audio player:", error.localizedDescription)
//    }
//}


func playAudio(audio: Audio) {
    guard let audioURL = audio.audioURL else {
        print("Invalid audio URL for audio", audio.title)
        return
    }

    let audioPlayer: AVAudioPlayer
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
        DispatchQueue.main.async { // adiciona aqui
            audioPlayer.play()
        } // adiciona aqui
        print("Audio URL:", audioURL)
    } catch {
        print("Error initializing audio player:", error.localizedDescription)
    }
}

