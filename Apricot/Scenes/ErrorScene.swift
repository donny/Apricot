//
//  ErrorScene.swift
//  Apricot
//
//  Created by Donny Kurniawan on 13/10/17.
//  Copyright © 2017 Donny Kurniawan. All rights reserved.
//

import SpriteKit

class ErrorScene: SKScene {
    private var label: SKLabelNode?
    
    override func didMove(to view: SKView) {
        self.label = self.childNode(withName: "//errorLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0x31:
            if let label = self.label,
                let action = SKAction.init(named: "ErrorPulse") {
                label.run(action)                
            }
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
}

