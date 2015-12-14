//
//  GameScene.swift
//  Nimble Ninja
//
//  Created by Greg Salvesen on 12/12/15.
//  Copyright (c) 2015 Dark Vault Studios. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var movingGround: NNMovingGround!
    var hero: NNHero!
    var cloudGenerator: NNCloudGenerator!
    var wallGenerator: NNWallGenerator!
    
    var isRunning = false
    var isGameOver = false
    
    override func didMoveToView(view: SKView) {
        backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        
        addMovingGround()
        addHero()
        addCloudGenerator()
        addWallGenerator()
        addTapToStartLabel()
        addPhysicsWorld()
    }
    
    func addMovingGround() {
        movingGround = NNMovingGround(size: CGSizeMake(view!.frame.size.height, kNNGroundHeight))
        movingGround.position = CGPointMake(0, view!.frame.size.height / 2)
        addChild(movingGround)
    }
    
    func addHero() {
        hero = NNHero()
        hero.position = CGPointMake(75, movingGround.position.y + movingGround.frame.size.height / 2 + hero.frame.size.height / 2)
        addChild(hero)
        hero.breathe()
    }
    
    func addCloudGenerator() {
        cloudGenerator = NNCloudGenerator(color: UIColor.clearColor(), size: view!.frame.size)
        cloudGenerator.position = view!.center
        addChild(cloudGenerator)
        cloudGenerator.populate(7)
        cloudGenerator.startGeneratingWithSpawnTime(5)
    }
    
    func addWallGenerator() {
        wallGenerator = NNWallGenerator(color: UIColor.clearColor(), size: view!.frame.size)
        wallGenerator.position = view!.center
        addChild(wallGenerator)
    }
    
    func addTapToStartLabel() {
        let tapToStartLabel = SKLabelNode(text: "Tap to start!")
        tapToStartLabel.name = "tapToStartLabel"
        tapToStartLabel.position.x = view!.center.x
        tapToStartLabel.position.y = view!.center.y + 40
        tapToStartLabel.fontName = "Helvetica"
        tapToStartLabel.fontColor = UIColor.blackColor()
        tapToStartLabel.fontSize = 22.0
        tapToStartLabel.runAction(blinkAnimation())
        addChild(tapToStartLabel)
    }
    
    func addPhysicsWorld() {
        physicsWorld.contactDelegate = self
    }
    
    func start() {
        isRunning = true
        hero.stop()
        movingGround.start()
        wallGenerator.startGeneratingWallsEvery(1)
        childNodeWithName("tapToStartLabel")?.removeFromParent()
        hero.startRunning()
    }
    
    func gameOver() {
        isGameOver = true
        
        //stop everything
        hero.fall()
        wallGenerator.stopWalls()
        hero.stop()
        movingGround.stop()
        cloudGenerator.stopGenerating()
        
        //create game over label
        let gameOverLabel = SKLabelNode(text: "Game Over!")
        gameOverLabel.name = "gameOverLabel"
        gameOverLabel.position.x = view!.center.x
        gameOverLabel.position.y = view!.center.y + 40
        gameOverLabel.fontName = "Helvetica"
        gameOverLabel.fontColor = UIColor.blackColor()
        gameOverLabel.fontSize = 22.0
        gameOverLabel.runAction(blinkAnimation())
        addChild(gameOverLabel)
    }
    
    func blinkAnimation() -> SKAction {
        let duration = 0.4
        let fadeOut = SKAction.fadeAlphaTo(0.0, duration: duration)
        let fadeIn = SKAction.fadeAlphaTo(1.0, duration: duration)
        let blink = SKAction.sequence([fadeOut, fadeIn])
        
        return SKAction.repeatActionForever(blink)
    }
    
    func restart() {
        let newScene = GameScene(size: view!.bounds.size)
        newScene.scaleMode = .AspectFill
        
        view!.presentScene(newScene)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if(isGameOver) {
            restart()
        } else if(!isRunning) {
            start()
        } else {
            hero.flip()
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        if(!isGameOver) {
            gameOver()
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
