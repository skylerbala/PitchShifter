//
//  AudioPlayerAudio.swift
//  PitchShifter
//
//  Created by Skyler Bala on 8/30/18.
//  Copyright © 2018 SkylerBala. All rights reserved.
//

import Foundation
import AVFoundation
import MediaPlayer

extension AudioPlayerViewController {
    func loadSong(songURL: URL) {
        audioFileURL = songURL
        
        engine.attach(player)
        engine.attach(effects)
        engine.connect(player, to: effects, format: audioFormat)
        engine.connect(effects, to: engine.mainMixerNode, format: audioFormat)
        engine.prepare()
        
        do {
            try engine.start()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func scheduleSong() {
        guard let audioFile = audioFile else {return}
        
        //skipFrame = 0
        
        // schedule plays file until finished; completion block hit only when song finished
        player.scheduleFile(audioFile, at: nil) {
            self.needsFileScheduled = true
        }
        
        
    }
}
