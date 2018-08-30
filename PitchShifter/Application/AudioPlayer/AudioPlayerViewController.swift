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
    
    let albumArtwork: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "album-artwork")
        return imageView
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "minus-10"), for: UIControlState.normal)
        return button
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
    
    let volumeDownLabel: UILabel = {
        let label = UILabel()
        label.text = "<"
        return label
    }()
    
    let volumeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(didChangeVolumeValue(_:)), for: .touchUpInside)
        slider.value = 0.5
        return slider
    }()
    
    let volumeUpLabel: UILabel = {
        let label = UILabel()
        label.text = "<))"
        return label
    }()
    
    let pitchLabel: UILabel = {
        let label = UILabel()
        label.text = "Pitch"
        return label
    }()
    
    let pitchSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = -12.0
        slider.maximumValue = 12.0
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(didChangePitchValue(_:)), for: .touchUpInside)
        slider.value = 0.00
        return slider
    }()
    
    let pitchValueLabel: UITextField = {
        let label = UITextField()
        label.text = "0.00"
        return label
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
    var volumeValue: Float = 0.5 {
        didSet {
            player.volume = volumeValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setViews()
    }
}


extension AudioPlayerViewController: SongsLibraryViewControllerDelegate {
    
    func songPicked(song: MPMediaItem) {
        if engine.isRunning {
            engine.detach(player)
            engine.detach(pitchEffect)
        }
        
        albumArtwork.image = song.artwork?.image(at: CGSize.zero)
        
        loadSong(songURL: song.assetURL!)
        
        
        playPauseButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
        playPauseButton.isSelected = true
        playPauseAction()
    }
}

