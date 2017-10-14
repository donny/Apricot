//
//  ViewController.swift
//  Apricot
//
//  Created by Donny Kurniawan on 2/10/17.
//  Copyright © 2017 Donny Kurniawan. All rights reserved.
//

import Cocoa
import SpriteKit
import SwiftGit2
import Result

class ViewController: NSViewController {
  @IBOutlet var sceneKitView: SKView!
  var repository: Repository? {
    didSet {
      refreshView()
    }
  }
  var branchName: String? {
    didSet {
      refreshView()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    loadScene(name: "InitialScene")
  }

  private func loadScene(name: String) {
    if let view = self.sceneKitView {
      if let scene = SKScene(fileNamed: name) {
        scene.scaleMode = .aspectFill
        view.presentScene(scene)
      }
      view.ignoresSiblingOrder = true
      view.showsFPS = true
      view.showsNodeCount = true
    }
  }

  private func refreshView() {
    if repository == nil || branchName == nil {
      loadScene(name: "ErrorScene")
    } else {
      loadScene(name: "MainScene")
    }
  }

  func showRepository(url: URL) {
    let repo = Repository.at(url)
    if let repo = repo.value {
      let latestCommit: Result<Commit, NSError> = repo
        .HEAD()
        .flatMap { repo.commit($0.oid) }
      if let commit = latestCommit.value {
        print("Latest Commit: \(commit.message) by \(commit.author.name)")
      } else {
        print("Could not get commit: \(latestCommit.error!)")
      }
    } else {
      print("Could not open repository: \(repo.error!)")
    }
  }
}
