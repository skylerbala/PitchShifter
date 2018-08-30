//
//  File.swift
//  PitchShifter
//
//  Created by Skyler Bala on 8/29/18.
//  Copyright © 2018 SkylerBala. All rights reserved.
//

import Foundation
import UIKit

extension SongsLibraryViewController {
    func setViews() {
        view.addSubview(tableView)
        
        let layoutGuide = view.safeAreaLayoutGuide
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: layoutGuide.topAnchor)
        ])
    }
}
