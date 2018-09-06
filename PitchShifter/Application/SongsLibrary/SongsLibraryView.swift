//
//  File.swift
//  PitchShifter
//
//  Created by Skyler Bala on 8/29/18.
//  Copyright © 2018 SkylerBala. All rights reserved.
//

import Foundation
import UIKit

extension SongsLibraryViewController {
    func setViews() {
        
        let layoutGuide = view.safeAreaLayoutGuide
        let tabBarBottom = view.frame.height - (tabBarController?.tabBar.frame.height)!
        
        view.addSubview(blackAnimationView)
        blackAnimationView.activate(leading: view.leadingAnchor, trailing: view.trailingAnchor, top: view.topAnchor, bottom: view.bottomAnchor, centerX: nil, centerY: nil, width: nil, height: nil)
        
        view.addSubview(nowPlayingView)
        nowPlayingView.frame = CGRect(x: 0, y: tabBarBottom - 55 - 8 - 8, width: view.frame.width, height: 55 + 8 + 8)
        
        view.addSubview(nowPlayingArtwork)
        nowPlayingArtwork.frame = CGRect(x: nowPlayingView.frame.minX + 8, y: nowPlayingView.frame.minY + 8, width: 55, height: 55)
        
        view.addSubview(nowPlayingLabel)
        nowPlayingArtwork.frame = CGRect(x: nowPlayingView.frame.minX + 8, y: nowPlayingView.frame.minY + 8, width: 55, height: 55)


    }
}


