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

    let songs = MPMediaQuery.songs().items as! [MPMediaItem]
    var songsLibraryViewControllerDelegate: SongsLibraryViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        print(cell.uuid)
        let song = songs[indexPath.row]
        songsLibraryViewControllerDelegate.songPicked(song: song)
        let viewControllers = tabBarController!.viewControllers
        tabBarController?.selectedViewController = viewControllers?[1]
    }
}

