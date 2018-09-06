//
//  TableViewController.swift
//  PitchShifter
//
//  Created by Skyler Bala on 8/29/18.
//  Copyright © 2018 SkylerBala. All rights reserved.
//

import UIKit
import MediaPlayer
import CoreLocation

protocol SongsLibraryViewControllerDelegate {
    func songPicked(song: MPMediaItem)
}

enum AnimationState {
    case fullScreen
    case thumbnail
}

class SongsLibraryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, CLLocationManagerDelegate {

    let songs = MPMediaQuery.songs().items as! [MPMediaItem]
    
    var songsLibraryViewControllerDelegate: SongsLibraryViewControllerDelegate!
    
    let nowPlayingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let nowPlayingLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let nowPlayingArtwork: UIImageView = {
        let artwork = UIImageView()
        return artwork
    }()
    
    let blackAnimationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.alpha = 0.0
        return view
    }()
    
    
    //Location
    
    let locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.desiredAccuracy = kCLLocationAccuracyBest
        return lm
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
        nowPlayingView.addGestureRecognizer(panGestureRecognizer)
        
        thumbnailFrame = nowPlayingView.frame
        artworkFrame = nowPlayingArtwork.frame
        tabBarFrame = tabBarController?.tabBar.frame
        currentState = .thumbnail
        
        navigationItem.title = "Songs"
        
        collectionView?.register(SongCell.self, forCellWithReuseIdentifier: "cellID")
        
        
        
        //Location
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways {
            locationManager.startUpdatingLocation()
        }
        else {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let latestLocation = locations.last
        let speedInMilesPerHour = (latestLocation?.speed)! / 1609.4 * 60 * 60
        let inputSpeed = 3.1
        
        let speedRatio = speedInMilesPerHour / inputSpeed
        print("Speed Ratio: \(speedRatio)")
        let volumeView = MPVolumeView()
        if let view = volumeView.subviews.first as? UISlider {
            view.value = Float(speedRatio)
        }
        
        print("Speed: \(speedInMilesPerHour)")
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
            cell.albumArtworkImageView.image = artworkImage
            cell.setImageCellColors(image: artworkImage)
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
            nowPlayingArtwork.image = artwork.image(at: CGSize())
        }
    }
}

