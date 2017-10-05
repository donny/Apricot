//
//  ViewController.swift
//  Apricot
//
//  Created by Donny Kurniawan on 2/10/17.
//  Copyright © 2017 Donny Kurniawan. All rights reserved.
//

import Cocoa
import SwiftGit2
import Result

class ViewController: NSViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }

  func showRepository(url: URL) {
    let URL = url
    let repo = Repository.at(URL)
    if let repo = repo.value {
      let latestCommit: Result<Commit, NSError> = repo
        .HEAD()
        .flatMap { repo.commit($0.oid) }
      if let commit = latestCommit.value {
        print("Latest Commit: \(commit.message) by \(commit.author.name)")
      } else {
        print("Could not get commit: \(latestCommit.error)")
      }
    } else {
      print("Could not open repository: \(repo.error)")
    }
  }
}
