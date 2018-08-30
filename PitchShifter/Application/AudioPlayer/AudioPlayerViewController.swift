//
//  ViewController.swift
//  Boilerplate
//
//  Created by Skyler Bala on 8/29/18.
//  Copyright © 2018 SkylerBala. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class AudioPlayerViewController: UIViewController {
    
    // MARK: Views
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let audioPlayerView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = UIColor.green
        return view
    }()
    
    let playPauseButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "play"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(playPauseButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "plus-10"), for: UIControlState.normal)
        return button
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "minus-10"), for: UIControlState.normal)
        return button
    }()
    
    let pitchStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = -12.0
        stepper.maximumValue = 12.0
        stepper.stepValue = 0.5
        stepper.addTarget(self, action: #selector(didChangePitchValue(_:)), for: .touchUpInside)
        //stepper.inputView
        return stepper
    }()

    
    // MARK: AVAudio Properties
    let engine = AVAudioEngine()
    let player = AVAudioPlayerNode()
    let pitchEffect = AVAudioUnitTimePitch()
    var audioFileURL: URL? {
        didSet {
            if let audioFileURL = audioFileURL {
                audioFile = try? AVAudioFile(forReading: audioFileURL)
            }
        }
    }
    var audioFile: AVAudioFile? {
        didSet {
            if let audioFile = audioFile {
                audioLengthSamples = audioFile.length
                audioFormat = audioFile.processingFormat
                audioSampleRate = Float((audioFormat?.sampleRate)!)
                audioLengthSeconds = Float(audioLengthSamples) / audioSampleRate
            }
        }
    }
    
    // MARK: AudioFile properties
    var audioFormat: AVAudioFormat?
    var audioSampleRate: Float = 0
    var audioLengthSeconds: Float = 0
    var audioLengthSamples: AVAudioFramePosition = 0
    var needsFileScheduled = true
    var pitchValue: Float = 0.0 {
        didSet {
            pitchEffect.pitch = pitchValue * 100
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        setViews()
        
        player.volume = 1.0
        
    }
    
    
    
    func setPitch() {
        pitchEffect.pitch = -500
        pitchEffect.rate = 2
    }
}


extension AudioPlayerViewController: SongsLibraryViewControllerDelegate {
    
    
    func songPicked(song: MPMediaItem) {
        if engine.isRunning {
            engine.detach(player)
            engine.detach(pitchEffect)
        }
        
        loadSong(songURL: song.assetURL!)
    }
}

