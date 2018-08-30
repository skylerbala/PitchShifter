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
    @objc func didChangePitchValue(_ sender: AnyObject) {
        var value: Float!
        if let slider = sender as? UISlider {
            value = Float(slider.value)
        }
        
        if let inputField = sender as? UITextField {
            let stringValue = inputField.text!
            value = Float(stringValue)
        }
        
        pitchValue = value
    }
    
    @objc func playPauseButtonTapped(_ sender: UIButton) {
        if engine.isRunning {
            sender.isSelected = !sender.isSelected
            if sender.isSelected {
                sender.setImage(#imageLiteral(resourceName: "pause"), for: UIControlState.normal)
            }
            else {
                sender.setImage(#imageLiteral(resourceName: "play"), for: UIControlState.normal)
            }
            
            playPauseAction()
        }
        else {
            //Alert
        }
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

