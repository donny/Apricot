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
    let spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)

    spinnyNode.lineWidth = 2.5
//    spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//    spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 2.0),
//                                      SKAction.fadeOut(withDuration: 2.0),
//                                      SKAction.removeFromParent()]))
    spinnyNode.position = CGPoint(x: -100, y: -100)
    spinnyNode.strokeColor = SKColor.blue

    addChild(spinnyNode)


    let spinnyNode2 = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
    spinnyNode2.lineWidth = 2.5
    spinnyNode2.position = CGPoint(x: -100, y: 100)
    spinnyNode2.strokeColor = SKColor.blue
    addChild(spinnyNode2)


    var path = CGMutablePath()
    path.move(to: CGPoint(x: spinnyNode.frame.midX, y: spinnyNode.frame.midY))
    path.addLine(to: CGPoint(x: spinnyNode2.frame.midX, y: spinnyNode2.frame.midY))

    let shape = SKShapeNode()
    shape.path = path
    shape.strokeColor = SKColor.red
    shape.lineWidth = 2
    addChild(shape)


  }
}
