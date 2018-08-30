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
    @objc func didChangePitchValue(_ sender: UISlider) {
        let sliderValue = Float(sender.value)
        pitchValue = sliderValue
        updatePitchLabel()
    }
    
    @objc func playPauseButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            sender.setImage(#imageLiteral(resourceName: "pause"), for: UIControlState.normal)
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "play"), for: UIControlState.normal)
        }
        
        playPauseAction()
    }
    
    @objc func didChangeVolumeValue(_ sender: UISlider) {
        let sliderValue = Float(sender.value)
        volumeValue = sliderValue
    }
    
    func playPauseAction() {
        if player.isPlaying {
            player.pause()
        }
        else {
            if needsFileScheduled {
                needsFileScheduled = false
                scheduleSong()
            }
            player.play()
        }
    }
}

