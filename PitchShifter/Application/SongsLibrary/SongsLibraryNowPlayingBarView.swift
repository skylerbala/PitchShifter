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
        
        view.addSubview(nowPlayingBarMainView)
        nowPlayingBarMainView.frame = CGRect(x: 0, y: tabBarBottom - 55 - 8 - 8, width: view.frame.width, height: 55 + 8 + 8)
        
        view.addSubview(nowPlayingBarArtworkImageView)
        nowPlayingBarArtworkImageView.frame = CGRect(x: nowPlayingBarArtworkImageView.frame.minX + 8, y: nowPlayingBarMainView.frame.minY + 8, width: 55, height: 55)
        
        view.addSubview(nowPlayingBarSongTitleLabel)
        nowPlayingBarArtworkImageView.frame = CGRect(x: nowPlayingBarMainView.frame.minX + 8, y: nowPlayingBarMainView.frame.minY + 8, width: 55, height: 55)


    }
}


