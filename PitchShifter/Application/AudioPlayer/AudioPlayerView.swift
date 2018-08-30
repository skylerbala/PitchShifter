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
        
        let audioPlayerStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = UILayoutConstraintAxis.horizontal
            stackView.distribution = UIStackViewDistribution.equalSpacing
            stackView.alignment = UIStackViewAlignment.center
            stackView.spacing = 30
            stackView.addArrangedSubview(minusButton)
            stackView.addArrangedSubview(playPauseButton)
            stackView.addArrangedSubview(plusButton)
            return stackView
        }()
        
        let pitchSliderStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = UILayoutConstraintAxis.horizontal
            stackView.distribution = UIStackViewDistribution.equalSpacing
            stackView.alignment = UIStackViewAlignment.center
            stackView.spacing = 30
            stackView.addArrangedSubview(pitchLabel)
            stackView.addArrangedSubview(pitchSlider)
            stackView.addArrangedSubview(pitchValueLabel)
            return stackView
        }()
        
        let volumeSliderStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = UILayoutConstraintAxis.horizontal
            stackView.distribution = UIStackViewDistribution.equalSpacing
            stackView.alignment = UIStackViewAlignment.center
            stackView.spacing = 30
            stackView.addArrangedSubview(volumeDownLabel)
            stackView.addArrangedSubview(volumeSlider)
            stackView.addArrangedSubview(volumeUpLabel)
            return stackView
        }()
        
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor)
        ])
        
        view.addSubview(albumArtwork)
        albumArtwork.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            albumArtwork.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            albumArtwork.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 75),
            albumArtwork.heightAnchor.constraint(equalToConstant: view.frame.width - 200),
            albumArtwork.widthAnchor.constraint(equalToConstant: view.frame.width - 200),
        ])
        
        view.addSubview(audioPlayerStackView)
        audioPlayerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            audioPlayerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            audioPlayerStackView.topAnchor.constraint(equalTo: albumArtwork.bottomAnchor, constant: 50),
            audioPlayerStackView.widthAnchor.constraint(equalToConstant: view.frame.width - 50),
        ])
        
        view.addSubview(pitchSliderStackView)
        pitchSliderStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pitchSliderStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pitchSliderStackView.topAnchor.constraint(equalTo: audioPlayerStackView.bottomAnchor, constant: 25),
            pitchSliderStackView.widthAnchor.constraint(equalToConstant: view.frame.width - 50),
        ])
        pitchSlider.widthAnchor.constraint(equalTo: pitchSliderStackView.widthAnchor, constant: -150).isActive = true

        view.addSubview(volumeSliderStackView)
        volumeSliderStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            volumeSliderStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            volumeSliderStackView.topAnchor.constraint(equalTo: pitchSliderStackView.bottomAnchor, constant: 25),
            volumeSliderStackView.widthAnchor.constraint(equalToConstant: view.frame.width - 50),
        ])
        volumeSlider.widthAnchor.constraint(equalTo: pitchSliderStackView.widthAnchor, constant: -150).isActive = true
    }
}
