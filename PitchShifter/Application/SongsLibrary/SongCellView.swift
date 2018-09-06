//
//  SongCellView.swift
//  PitchShifter
//
//  Created by Skyler Bala on 9/6/18.
//  Copyright © 2018 SkylerBala. All rights reserved.
//

import Foundation
import UIKit

extension SongCell {
    func setCellViews() {
        addSubview(artworkImageView)
        addSubview(textView)
        addSubview(songTitleLabel)
        addSubview(artistLabel)
        addSubview(separatorView)
        
        artworkImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            artworkImageView.topAnchor.constraint(equalTo: self.topAnchor),
            artworkImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            artworkImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1),
            artworkImageView.widthAnchor.constraint(equalTo: artworkImageView.heightAnchor)
        ])
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            textView.leftAnchor.constraint(equalTo: artworkImageView.rightAnchor, constant: 8),
            textView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2.0 / 3.0),
            textView.widthAnchor.constraint(equalToConstant: self.frame.size.width - artworkImageView.frame.width - 8)
        ])
        
        songTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            songTitleLabel.topAnchor.constraint(equalTo: textView.topAnchor, constant: -8),
            songTitleLabel.leftAnchor.constraint(equalTo: textView.leftAnchor),
            songTitleLabel.heightAnchor.constraint(equalTo: textView.heightAnchor, multiplier: 1.0 / 2.0),
            songTitleLabel.widthAnchor.constraint(equalTo: textView.widthAnchor)
        ])
        
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: songTitleLabel.bottomAnchor, constant: 8),
            artistLabel.leftAnchor.constraint(equalTo: textView.leftAnchor),
            artistLabel.heightAnchor.constraint(equalTo: textView.heightAnchor, multiplier: 1.0 / 2.0),
            artistLabel.widthAnchor.constraint(equalTo: textView.widthAnchor)
        ])
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: artworkImageView.bottomAnchor),
            separatorView.leftAnchor.constraint(equalTo: self.leftAnchor),
            separatorView.rightAnchor.constraint(equalTo: self.rightAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
