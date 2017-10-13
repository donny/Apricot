//
//  WindowController.swift
//  Apricot
//
//  Created by Donny Kurniawan on 3/10/17.
//  Copyright © 2017 Donny Kurniawan. All rights reserved.
//

import Cocoa
import SwiftGit2
import Result

class WindowController: NSWindowController {
  @IBOutlet var popUpButton: NSPopUpButton!

  override func windowDidLoad() {
    super.windowDidLoad()
    popUpButton.removeAllItems()
  }

  func showLocalBranches(repository: Repository) {
    repository.localBranches().value?.forEach {
      self.popUpButton.addItem(withTitle: $0.name)
    }
    if self.popUpButton.numberOfItems > 0 {
      self.performBranchSelectedAction(self.popUpButton)
    }
  }

  @IBAction func performOpenRepositoryAction(_ sender: NSButton) {
    openRepository()
  }

  @IBAction func performBranchSelectedAction(_ sender: NSPopUpButton) {
    print(sender.indexOfSelectedItem)
  }

  func openRepository() {
    guard let window = self.window else { return }

    let openPanel = NSOpenPanel()
    openPanel.allowsMultipleSelection = false
    openPanel.canChooseDirectories = true
    openPanel.canChooseFiles = false

    openPanel.beginSheetModal(for: window, completionHandler: { response in
      switch response {
      case .OK:
        if let url = openPanel.urls.first {
          if let controller = self.contentViewController as? ViewController {
            controller.showRepository(url: url)

            let repository = Repository.at(url)
            if let repository = repository.value {
              self.showLocalBranches(repository: repository)
            } else {
              print("Could not open repository: \(repository.error!)")
            }
          }
        }
      default:
        break
      }
    })
  }
}
