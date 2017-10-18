//
//  LineNode.swift
//  Apricot
//
//  Created by Donny Kurniawan on 19/10/17.
//  Copyright © 2017 Donny Kurniawan. All rights reserved.
//

import SpriteKit

class LineNode: SKShapeNode {

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(from: CGPoint, to: CGPoint) {
    super.init()

    var path = CGMutablePath()
    path.move(to: from)
    path.addLine(to: to)
    self.path = path
    self.strokeColor = SKColor.red
    self.lineWidth = 2

  }
}
