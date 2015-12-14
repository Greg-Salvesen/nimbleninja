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
        super.init(texture: nil, color: WALL_COLOR, size: CGSizeMake(WALL_WIDTH, WALL_HEIGHT))
        
        startMoving()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startMoving() {
        let moveLeft = SKAction.moveByX(-kNNDefaultXToMovePerSecond, y: 0, duration: 1.0)
        runAction(SKAction.repeatActionForever(moveLeft))
    }
    
}
