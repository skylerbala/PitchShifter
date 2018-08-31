//
//  MainViewController.swift
//  PitchShifter
//
//  Created by Skyler Bala on 8/29/18.
//  Copyright © 2018 SkylerBala. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let songsLibraryVC = SongsLibraryViewController(collectionViewLayout: layout)

        let audioPlayerVC = AudioPlayerViewController()
        
        songsLibraryVC.tabBarItem = UITabBarItem(title: "Library", image: nil, selectedImage: nil)
        
        audioPlayerVC.tabBarItem = UITabBarItem(title: "Player", image: nil, selectedImage: nil)
    
        songsLibraryVC.songsLibraryViewControllerDelegate = audioPlayerVC
        
        viewControllers = [songsLibraryVC, audioPlayerVC]
    }
    
    

}
