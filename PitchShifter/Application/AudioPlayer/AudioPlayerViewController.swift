//
//  ViewController.swift
//  Boilerplate
//
//  Created by Skyler Bala on 8/29/18.
//  Copyright © 2018 SkylerBala. All rights reserved.
//

import UIKit
import AVFoundation

class AudioPlayerViewController: UIViewController {
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    let audioEngine = AVAudioEngine()
    let audioPlayer = AVAudioPlayerNode()
    
    var file: AVAudioFile!
    var pitchController: AVAudioUnitTimePitch!
    
    var songURL: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        setViews()
        
        audioPlayer.volume = 1.0
        
//        let path = Bundle.main.path(forResource: "YoungFolks", ofType: "mp3")
//        let url = URL(fileURLWithPath: path!)
        
    }
    
    func setSong(songURL: URL) {
        file = try? AVAudioFile(forReading: songURL)
        let buffer = AVAudioPCMBuffer(pcmFormat: file.processingFormat, frameCapacity: AVAudioFrameCount(file.length))
        
        do {
            try file.read(into: buffer!)
        } catch _ {
            print("Error reading file")
        }
        
        setPitch()
        
        audioEngine.attach(audioPlayer)
        audioEngine.attach(pitchController)
        audioEngine.connect(audioPlayer, to: pitchController, format: buffer?.format)
        
        audioEngine.connect(pitchController, to: audioEngine.mainMixerNode, format: buffer?.format)
        audioPlayer.scheduleBuffer(buffer!, at: nil, options: AVAudioPlayerNodeBufferOptions.loops, completionHandler: nil)
        
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch _ {
            print("Error engine did not start")
        }
        
        audioPlayer.play()
    }
    
    func setPitch() {
        pitchController = AVAudioUnitTimePitch()
        pitchController.pitch = -500
        pitchController.rate = 2
    }
    
    func getAudioFile() {
        
    }
}


extension AudioPlayerViewController: SongsLibraryViewControllerDelegate {
    func songPicked(songURL: URL) {
        setSong(songURL: songURL)
    }
}

