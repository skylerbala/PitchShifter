//
//  TableViewController.swift
//  PitchShifter
//
//  Created by Skyler Bala on 8/29/18.
//  Copyright © 2018 SkylerBala. All rights reserved.
//

import UIKit
import MediaPlayer

protocol SongsLibraryViewControllerDelegate {
    func songPicked(song: MPMediaItem)
}

class SongsLibraryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var songs = MPMediaQuery.songs().items!
    
    var songsLibraryViewControllerDelegate: SongsLibraryViewControllerDelegate!
    
    // MARK: Now Playing Bar Views
    let nowPlayingBarMainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.isUserInteractionEnabled = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    let nowPlayingBarBorder: UIView = {
        let border = UIView()
        return border
    }()
    
    let nowPlayingBarArtworkImageView: UIImageView = {
        let artwork = UIImageView()
        artwork.contentMode = .scaleAspectFit
        artwork.dropShadow()
        return artwork
    }()
    
    let nowPlayingBarSongTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let blackFadeAnimationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.alpha = 0.0
        return view
    }()
    
    // MARK: Animations
    var panGestureRecognizer: UIPanGestureRecognizer!
    var animator: UIViewPropertyAnimator?
    var currentState: AnimationState!
    var thumbnailFrame: CGRect!
    var tabBarFrame: CGRect!
    var artworkFrame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        nowPlayingBarMainView.addGestureRecognizer(panGestureRecognizer)
        
        thumbnailFrame = nowPlayingBarMainView.frame
        artworkFrame = nowPlayingBarMainView.frame
        tabBarFrame = tabBarController?.tabBar.frame
        currentState = .thumbnail
        
        navigationItem.title = "Songs"
        
        collectionView?.register(SongCell.self, forCellWithReuseIdentifier: "cellID")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songs.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! SongCell
        let song = songs[indexPath.row]
        cell.songTitleLabel.text = song.title
        cell.artistLabel.text = song.artist
        if let artworkImage = song.artwork?.image(at: CGSize()) {
            cell.artworkImageView.image = artworkImage
            cell.setSongCellColors(image: artworkImage)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! SongCell
        let song = songs[indexPath.row]
        let audioPlayerVC = AudioPlayerViewController()
        self.songsLibraryViewControllerDelegate.songPicked(song: song)
        
        
        if let artwork = song.artwork {
            nowPlayingBarArtworkImageView.image = artwork.image(at: CGSize())
            nowPlayingBarMainView.backgroundColor = artwork.image(at: CGSize())?.getColors().background
            nowPlayingBarSongTitleLabel.text = song.title
        }
    }
}

