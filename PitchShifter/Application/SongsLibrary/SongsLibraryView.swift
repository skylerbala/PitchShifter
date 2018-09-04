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
        nowPlayingView.frame = CGRect(x: 0, y: tabBarBottom - 50, width: view.frame.width, height: view.frame.height)
        
        NSLayoutConstraint.activate([
            nowPlayingArtwork.leadingAnchor.constraint(equalTo: nowPlayingView.leadingAnchor, constant: 8),
            nowPlayingArtwork.bottomAnchor.constraint(equalTo: nowPlayingView.bottomAnchor, constant: -8),
            nowPlayingArtwork.topAnchor.constraint(equalTo: nowPlayingView.topAnchor, constant: 8),

        ])
        
        // replace
        nowPlayingArtwork.widthAnchor.constraint(equalToConstant: 50)


    }
}


