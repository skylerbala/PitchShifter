//
//  MainView.swift
//  Boilerplate
//
//  Created by Skyler Bala on 8/29/18.
//  Copyright © 2018 SkylerBala. All rights reserved.
//

import Foundation
import UIKit

extension AudioPlayerViewController {
    
    func setViews() {
        let layoutGuide = view.safeAreaLayoutGuide
        
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor)
        ])
        
        view.addSubview(audioPlayerView)
        
        audioPlayerView.axis = UILayoutConstraintAxis.horizontal
        audioPlayerView.distribution = UIStackViewDistribution.equalSpacing
        audioPlayerView.alignment = UIStackViewAlignment.center
        audioPlayerView.spacing = 30
        
        audioPlayerView.addArrangedSubview(minusButton)
        audioPlayerView.addArrangedSubview(playPauseButton)
        audioPlayerView.addArrangedSubview(plusButton)
        
        audioPlayerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            audioPlayerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            audioPlayerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
            audioPlayerView.heightAnchor.constraint(equalToConstant: 100),
            audioPlayerView.widthAnchor.constraint(equalToConstant: view.frame.width - 50.0),
        ])
        
        view.addSubview(pitchStepper)
        pitchStepper.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pitchStepper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pitchStepper.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150),
            pitchStepper.heightAnchor.constraint(equalToConstant: 100),
            pitchStepper.widthAnchor.constraint(equalToConstant: view.frame.width - 50.0),
        ])
    }
}
