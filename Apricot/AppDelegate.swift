//
//  AppDelegate.swift
//  Apricot
//
//  Created by Donny Kurniawan on 2/10/17.
//  Copyright © 2017 Donny Kurniawan. All rights reserved.
//

import Cocoa
import SwiftGit2
import Result

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }

  func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  @IBAction func openDocument(_ sender: NSMenuItem) {
    guard let window = NSApplication.shared.windows.first else { return }

    let openPanel = NSOpenPanel()
    openPanel.allowsMultipleSelection = false
    openPanel.canChooseDirectories = true
    openPanel.canChooseFiles = false

    openPanel.beginSheetModal(for: window, completionHandler: { response in
      switch response {
      case .OK:
        if let url = openPanel.urls.first {
          print(url)



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
      default:
        break
      }
    })
  }
}
