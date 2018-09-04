//
//  SongsLibraryActions.swift
//  PitchShifter
//
//  Created by Skyler Bala on 8/30/18.
//  Copyright © 2018 SkylerBala. All rights reserved.
//

import Foundation
import UIKit

extension SongsLibraryViewController {
    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: view.superview)
        
        switch recognizer.state {
            case.began:
                startPanning()
            case.changed:
                scrub(translation: translation)
            case.ended:
                let velocity = recognizer.velocity(in: view.superview)
                endAnimation(translation: translation, velocity: velocity)
            default:
                print("Error pan")
        }
    }
    
    func startPanning() {
        var finalFrame: CGRect = CGRect()
        var blackAnimationiewAlpha: CGFloat = 0
        
        switch currentState {
            case .fullScreen:
                finalFrame = thumbnailFrame
                blackAnimationiewAlpha = 0
            case .thumbnail:
                finalFrame = view.frame
                blackAnimationiewAlpha = 1
            default:
                print("unknown state")
        }
        
        animator = UIViewPropertyAnimator(duration: 1.0, dampingRatio: 0.8, animations: {
            self.nowPlayingView.frame = finalFrame
            self.blackAnimationView.alpha = blackAnimationiewAlpha
        })
    }
    
    func scrub(translation: CGPoint) {
        if let animator = self.animator {
            let yTranslation = view.center.y + translation.y
            
            var progress: CGFloat = 0
            
            switch currentState {
                case .fullScreen:
                    progress = (yTranslation / view.center.y) - 1
                case .thumbnail:
                    progress = 1 - (yTranslation / view.center.y)
                default:
                    print("unknown state")
            }
            
            progress = max(0.0001, min(0.9999, progress))
            
            animator.fractionComplete = progress
            
        }
    }
    
    func endAnimation(translation: CGPoint, velocity: CGPoint) {
        
        if let animator = self.animator {
            panGestureRecognizer.isEnabled = false
            
            let screenHeight = view.frame.size.height
            
            switch currentState {
                case .fullScreen:
                    if translation.y >= (-screenHeight) / 3 || velocity.y <= 100 {
                        animator.isReversed = false
                        animator.addCompletion({ (position) in
                            self.currentState = .thumbnail
                            self.panGestureRecognizer.isEnabled = true
                        })
                    }
                    else {
                        animator.isReversed = true
                        animator.addCompletion({ (position) in
                            self.currentState = .fullScreen
                            self.panGestureRecognizer.isEnabled = true
                        })
                    }
                case .thumbnail:
                    if translation.y <= (-screenHeight) / 3 || velocity.y <= -100 {
                        animator.isReversed = false
                        animator.addCompletion({ (position) in
                            self.currentState = .fullScreen
                            self.panGestureRecognizer.isEnabled = true
                        })
                    }
                    else {
                        animator.isReversed = true
                        animator.addCompletion({ (position) in
                            self.currentState = .thumbnail
                            self.panGestureRecognizer.isEnabled = true
                        })
                    }
                default:
                    print("unknown state")
            }
            
            let vector = CGVector(dx: velocity.x / 100, dy: velocity.y / 100)
            let springParams = UISpringTimingParameters(dampingRatio: 0.8, initialVelocity: vector)
            
            animator.continueAnimation(withTimingParameters: springParams, durationFactor: 1)
        }
    }
}
