//
//  NNConstants.swift
//  Nimble Ninja
//
//  Created by Greg Salvesen on 12/13/15.
//  Copyright © 2015 Dark Vault Studios. All rights reserved.
//

import Foundation
import UIKit

// Configuration
let kNNGroundHeight: CGFloat = 20.0

// Initial Variables
let kNNDefaultXToMovePerSecond: CGFloat = 320.0

// Collision Detection
let kNNHeroCategory: UInt32 = 0x1 << 0
let kNNWallCategory: UInt32 = 0x1 << 1

// Game Variables
let kNumberofPointsPerLevel = 5
let kNNLevelGenerationTimes: [NSTimeInterval] = [1.0, 0.8, 0.6, 0.4, 0.3]
