//
//  NNWallGenerator.swift
//  Nimble Ninja
//
//  Created by Greg Salvesen on 12/14/15.
//  Copyright © 2015 Dark Vault Studios. All rights reserved.
//

import Foundation
import SpriteKit

class NNWallGenerator: SKSpriteNode {
    
    var generationTimer: NSTimer?
    var walls = [NNWall]()
    var wallTrackers = [NNWall]()
    
    func startGeneratingWallsEvery(seconds: NSTimeInterval) {
        generationTimer = NSTimer.scheduledTimerWithTimeInterval(seconds, target: self, selector: "generateWall", userInfo: nil, repeats: true)
    }
    
    func stopGenerating() {
        generationTimer?.invalidate()
    }
    
    func generateWall() {
        var scale: CGFloat
        let rand = arc4random_uniform(2)
        
        if(rand == 0) {
            scale = -1.0
        } else {
            scale = 1.0
        }
        
        let wall = NNWall()
        wall.position.x = size.width / 2 + wall.size.width / 2
        wall.position.y = scale * (kNNGroundHeight / 2 + wall.size.height / 2)
        walls.append(wall)
        wallTrackers.append(wall)
        addChild(wall)
    }
    
    func stopWalls() {
        stopGenerating()
        for wall in walls {
            wall.stopMoving()
        }
    }
    
}