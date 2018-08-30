//
//  SongsLibraryViewController.swift
//  PitchShifter
//
//  Created by Skyler Bala on 8/29/18.
//  Copyright © 2018 SkylerBala. All rights reserved.
//

import UIKit
import MediaPlayer

protocol SongsLibraryViewControllerDelegate {
    func songPicked(songURL: URL)
}

class SongsLibraryViewController: MPMediaPickerController, MPMediaPickerControllerDelegate {
    
    var songsLibraryViewControllerDelegate: SongsLibraryViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        for item in mediaItemCollection.items {
            if let assetURL = item.assetURL {
                let viewControllers = tabBarController!.viewControllers
                tabBarController?.selectedViewController = viewControllers?[1]
                songsLibraryViewControllerDelegate.songPicked(songURL: assetURL)
            }
        }
    }
}
