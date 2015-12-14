//
//  NNPointsLabel.swift
//  Nimble Ninja
//
//  Created by Greg Salvesen on 12/14/15.
//  Copyright © 2015 Dark Vault Studios. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class NNPointsLabel: SKLabelNode {
    
    var number = 0
    var label = ""
    
    init(num: Int, label: String) {
        super.init()
        
        fontColor = UIColor.blackColor()
        fontName = "Helvetica"
        fontSize = 24.0
        
        number = num
        self.label = label
        text = label + "\(num)"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func increment() {
        number++
        text = label + "\(number)"
    }
    
    func setNum(num: Int) {
        number = num
        text = label + "\(number)"
    }
    
}