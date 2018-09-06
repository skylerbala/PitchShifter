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
    
    // MARK: SongCell Views
    let artworkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "artwork")
        imageView.backgroundColor = UIColor.white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let textView: UIView = {
        let view = UIView()
        view.isHidden = true
        return view
    }()
    
    let songTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Song Title Not Found"
        return label
    }()
    
    let artistLabel: UILabel = {
        let label = UILabel()
        label.text = "Artist Not Found"
        return label
    }()

    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    func setSongCellColors(image: UIImage) {
        if let imageColorFromCache = imageColorCache[songTitleLabel.text! + artistLabel.text!] {
            self.backgroundColor = imageColorFromCache.background
            songTitleLabel.textColor = imageColorFromCache.primary
            artistLabel.textColor = imageColorFromCache.secondary
        }
        else {
            let colors = image.getColors(quality: .lowest)
            self.backgroundColor = colors.background
            songTitleLabel.textColor = colors.primary
            artistLabel.textColor = colors.secondary
            
            imageColorCache[songTitleLabel.text!] = colors
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
