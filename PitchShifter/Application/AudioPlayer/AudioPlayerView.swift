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
    }
}
