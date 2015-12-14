//
//  NNCloudGenerator.swift
//  Nimble Ninja
//
//  Created by Greg Salvesen on 12/14/15.
//  Copyright © 2015 Dark Vault Studios. All rights reserved.
//

import Foundation
import SpriteKit

class NNCloudGenerator: SKSpriteNode {
    
    let CLOUD_WIDTH: CGFloat = 125.0
    let CLOUD_HEIGHT: CGFloat = 55.0
    
    var generationTimer: NSTimer!
    
    func populate(num: Int) {
        for var i = 0; i < num; i++ {
            let cloud = NNCloud(size: CGSizeMake(CLOUD_WIDTH, CLOUD_HEIGHT))
            let x = CGFloat(arc4random_uniform(UInt32(size.width))) - size.width / 2
            let y = CGFloat(arc4random_uniform(UInt32(size.height))) - size.height / 2
            
            cloud.position = CGPointMake(x, y)
            cloud.zPosition = -1
            addChild(cloud)
            
            
        }
    }
    
    func startGeneratingWithSpawnTime(seconds: NSTimeInterval) {
       generationTimer = NSTimer.scheduledTimerWithTimeInterval(seconds, target: self, selector: "generateNewCloud", userInfo: nil, repeats: true)
    }
    
    func generateNewCloud() {
        let x = size.width / 2 + CLOUD_WIDTH / 2
        let y = CGFloat(arc4random_uniform(UInt32(size.height))) - size.height / 2
        let cloud = NNCloud(size: CGSizeMake(CLOUD_WIDTH, CLOUD_HEIGHT))
        
        cloud.position = CGPointMake(x, y)
        cloud.zPosition = -1
        addChild(cloud)
    }
    
}
