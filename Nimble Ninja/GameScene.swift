//
//  GameScene.swift
//  Nimble Ninja
//
//  Created by Greg Salvesen on 12/12/15.
//  Copyright (c) 2015 Dark Vault Studios. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var movingGround: NNMovingGround!
    var hero: NNHero!
    var cloudGenerator: NNCloudGenerator!
    
    var isRunning = false
    
    override func didMoveToView(view: SKView) {
        backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        
        // add ground
        movingGround = NNMovingGround(size: CGSizeMake(view.frame.size.height, kNNGroundHeight))
        movingGround.position = CGPointMake(0, view.frame.size.height / 2)
        addChild(movingGround)
        
        //add hero
        hero = NNHero()
        hero.position = CGPointMake(75, movingGround.position.y + movingGround.frame.size.height / 2 + hero.frame.size.height / 2)
        addChild(hero)
        hero.breathe()
        
        // add cloud generation
        cloudGenerator = NNCloudGenerator(color: UIColor.clearColor(), size: view.frame.size)
        cloudGenerator.position = view.center
        addChild(cloudGenerator)
        cloudGenerator.populate(7)
        cloudGenerator.startGeneratingWithSpawnTime(5)
    }
    
    func start() {
        isRunning = true
        hero.stop()
        movingGround.start()
        hero.startRunning()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if(!isRunning) {
            start()
        } else {
            hero.flip()
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}