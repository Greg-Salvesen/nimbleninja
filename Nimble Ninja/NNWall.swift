//
//  NNWall.swift
//  Nimble Ninja
//
//  Created by Greg Salvesen on 12/14/15.
//  Copyright © 2015 Dark Vault Studios. All rights reserved.
//

import Foundation
import SpriteKit

class NNWall: SKSpriteNode {
    
    let WALL_WIDTH: CGFloat = 30.0
    let WALL_HEIGHT: CGFloat = 50.0
    let WALL_COLOR = UIColor.blackColor()
    
    init() {
        let size = CGSizeMake(WALL_WIDTH, WALL_HEIGHT)
        super.init(texture: nil, color: WALL_COLOR, size: size)
        
        startMoving()
        loadPhysicsBodyWithSize(size)
    }
    
    func loadPhysicsBodyWithSize(size: CGSize) {
        physicsBody = SKPhysicsBody(rectangleOfSize: size)
        physicsBody?.categoryBitMask = kNNWallCategory
        physicsBody?.affectedByGravity = false;
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startMoving() {
        let moveLeft = SKAction.moveByX(-kNNDefaultXToMovePerSecond, y: 0, duration: 1.0)
        runAction(SKAction.repeatActionForever(moveLeft))
    }
    
    func stopMoving() {
        removeAllActions()
    }
    
}
