//
//  MainScene.swift
//  Apricot
//
//  Created by Donny Kurniawan on 14/10/17.
//  Copyright © 2017 Donny Kurniawan. All rights reserved.
//

import SpriteKit

class MainScene: SKScene {
  private var label: SKLabelNode?

  override func didMove(to view: SKView) {
    self.label = self.childNode(withName: "//mainLabel") as? SKLabelNode
    if let label = self.label {
      label.alpha = 0.0
      label.run(SKAction.fadeIn(withDuration: 2.0))
    }
  }
}
