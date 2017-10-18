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


    let w = (self.size.width + self.size.height) * 0.05
    let spinnyNode = CommitNode.init()
    addChild(spinnyNode)


    let spinnyNode2 = CommitNode.init()
    spinnyNode2.position = CGPoint(x: -100, y: -100)
    addChild(spinnyNode2)


    let source = CGPoint(x: spinnyNode.frame.midX, y: spinnyNode.frame.midY)
    let destination = CGPoint(x: spinnyNode2.frame.midX, y: spinnyNode2.frame.midY)

    let shape = LineNode.init(from: source, to: destination)
    addChild(shape)


  }
}
