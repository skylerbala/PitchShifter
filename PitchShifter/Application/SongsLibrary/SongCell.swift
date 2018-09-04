//
//  SongCell.swift
//  PitchShifter
//
//  Created by Skyler Bala on 8/30/18.
//  Copyright © 2018 SkylerBala. All rights reserved.
//

import Foundation
import UIKit

var imageColorCache = [String: UIImageColors]()

class SongCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCellViews()
    }
    
    var albumArtworkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        return imageView
    }()
    
    var songTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "dsklfj"
        return label
    }()
    
    var artistLabel: UILabel = {
        let label = UILabel()
        label.text = "Kanye West"
        return label
    }()

    var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    var imageColors: UIImageColors!
    
    func setCellViews() {
        addSubview(albumArtworkImageView)
        addSubview(separatorView)
        addSubview(songTitleLabel)
        addSubview(artistLabel)
        
        addConstraintsWithFormat(format: "H:|-8-[v0(84)]|", views: albumArtworkImageView)
        
        addConstraintsWithFormat(format: "V:|-8-[v0(84)]-8-[v1(1)]|", views: albumArtworkImageView, separatorView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        
        // left constraints
        addConstraint(NSLayoutConstraint(item: songTitleLabel, attribute: .left, relatedBy: .equal, toItem: albumArtworkImageView, attribute: .right, multiplier: 1, constant: 8))
        addConstraint(NSLayoutConstraint(item: artistLabel, attribute: .left, relatedBy: .equal, toItem: albumArtworkImageView, attribute: .right, multiplier: 1, constant: 8))
        
        addConstraintsWithFormat(format: "V:|-16-[v0]-[v1]-8-|", views: songTitleLabel, artistLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageCellColors(image: UIImage) {
        if let imageColorFromCache = imageColorCache[songTitleLabel.text!] {
            backgroundColor = imageColorFromCache.background
            songTitleLabel.textColor = imageColorFromCache.primary
            artistLabel.textColor = imageColorFromCache.secondary
        }
        else {
            let colors = image.getColors(quality: .lowest)
            imageColorCache[songTitleLabel.text!] = colors
            backgroundColor = colors.background
            songTitleLabel.textColor = colors.primary
            artistLabel.textColor = colors.secondary
        }
    }
}
