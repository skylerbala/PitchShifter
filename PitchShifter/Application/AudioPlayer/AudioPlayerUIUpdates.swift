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
    func updatePitchLabelAndSlider() {
        pitchSlider.setValue(pitchValue, animated: true)
        let pitchValueRounded = String(format: "%.2f", pitchValue)
        pitchValueLabel.text = "\(pitchValueRounded)"
    }
    
    func updateRateLabelAndSlider() {
        rateSlider.setValue(rateValue, animated: true)
        let rateValueRounded = String(format: "%.2f", rateValue)
        rateValueLabel.text = "\(rateValueRounded)"
    }
}
