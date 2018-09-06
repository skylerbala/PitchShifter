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
        var tabBarFinalFrame: CGRect = CGRect()
        var artworkFinalFrame: CGRect = CGRect()
        var cornerRadius: CGFloat!
        
        switch currentState {
            case .fullScreen:
                finalFrame = thumbnailFrame
                tabBarFinalFrame = tabBarFrame
                artworkFinalFrame = artworkFrame
                blackAnimationiewAlpha = 0
                cornerRadius = 0
            case .thumbnail:
                finalFrame = CGRect(x: 0, y: view.safeAreaLayoutGuide.layoutFrame.minY, width: view.frame.width, height: view.frame.height)
                tabBarFinalFrame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: view.frame.height)
                blackAnimationiewAlpha = 0.7
                artworkFinalFrame = CGRect(x: view.safeAreaLayoutGuide.layoutFrame.minX + 16, y: view.safeAreaLayoutGuide.layoutFrame.minY + 16, width: view.frame.width - (16 * 2), height: view.frame.width - (16 * 2))
                cornerRadius = 40
            default:
                print("unknown state")
        }
        
        animator = UIViewPropertyAnimator(duration: 1.0, dampingRatio: 0.8, animations: {
            self.nowPlayingView.frame = finalFrame
            self.blackAnimationView.alpha = blackAnimationiewAlpha
            self.nowPlayingArtwork.frame = artworkFinalFrame
            self.tabBarController?.tabBar.frame = tabBarFinalFrame
            self.nowPlayingView.layer.cornerRadius = cornerRadius
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
