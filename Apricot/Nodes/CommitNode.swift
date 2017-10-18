//
//  CommitNode.swift
//  Apricot
//
//  Created by Donny Kurniawan on 19/10/17.
//  Copyright © 2017 Donny Kurniawan. All rights reserved.
//

import SpriteKit

class CommitNode: SKShapeNode {
  let width: CGFloat = 20
  let height: CGFloat = 20
  let cornerRadius: CGFloat = 7

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override init() {
    super.init()
    let rect = CGRect.init(x: 0, y: 0, width: width, height: height)

    self.path = CGPath.init(rect: rect, transform: nil)
    self.lineWidth = 2.5
    self.strokeColor = SKColor.green
  }
}
