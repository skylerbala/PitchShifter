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
        
        view.addSubview(blackFadeAnimationView)
        view.addSubview(nowPlayingBarMainView)
        view.addSubview(nowPlayingBarArtworkImageView)
        view.addSubview(nowPlayingBarSongTitleLabel)
        
        blackFadeAnimationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blackFadeAnimationView.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            blackFadeAnimationView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
            blackFadeAnimationView.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor),
            blackFadeAnimationView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor)
        ])
        
        nowPlayingBarMainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nowPlayingBarMainView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
            nowPlayingBarMainView.heightAnchor.constraint(equalToConstant: 75),
            nowPlayingBarMainView.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor),
            nowPlayingBarMainView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor)
        ])
        
        nowPlayingBarArtworkImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nowPlayingBarArtworkImageView.topAnchor.constraint(equalTo: nowPlayingBarMainView.topAnchor, constant: 8),
            nowPlayingBarArtworkImageView.leftAnchor.constraint(equalTo: nowPlayingBarMainView.leftAnchor, constant: 8),
            nowPlayingBarArtworkImageView.bottomAnchor.constraint(equalTo: nowPlayingBarMainView.bottomAnchor, constant: -8),
            nowPlayingBarArtworkImageView.widthAnchor.constraint(equalTo: nowPlayingBarArtworkImageView.heightAnchor)
        ])
        
        nowPlayingBarSongTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nowPlayingBarSongTitleLabel.centerYAnchor.constraint(equalTo: nowPlayingBarMainView.centerYAnchor),
            nowPlayingBarSongTitleLabel.leftAnchor.constraint(equalTo: nowPlayingBarArtworkImageView.rightAnchor, constant: 8),
            nowPlayingBarSongTitleLabel.heightAnchor.constraint(equalTo: nowPlayingBarMainView.heightAnchor, multiplier: 1.0 / 3.0),
            nowPlayingBarSongTitleLabel.widthAnchor.constraint(equalToConstant: view.frame.size.width - nowPlayingBarArtworkImageView.frame.width - 8)
        ])
    
        
        view.addSubview(nowPlayingBarSongTitleLabel)
        nowPlayingBarArtworkImageView.frame = CGRect(x: nowPlayingBarMainView.frame.minX + 8, y: nowPlayingBarMainView.frame.minY + 8, width: 55, height: 55)


    }
}


