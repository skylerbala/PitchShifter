//
//  AudioPlayerUIUpdates.swift
//  PitchShifter
//
//  Created by Skyler Bala on 8/30/18.
//  Copyright © 2018 SkylerBala. All rights reserved.
//

import Foundation
import UIKit

extension AudioPlayerViewController {
    func updatePitchLabel() {
        let pitchValueRounded = String(format: "%.2f", pitchValue)

        pitchValueLabel.text = "\(pitchValueRounded)"
    }
}