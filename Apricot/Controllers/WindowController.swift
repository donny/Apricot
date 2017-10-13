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
  }

  @IBAction func performOpenRepositoryAction(_ sender: NSButton) {
    openRepository()
  }

  @IBAction func performBranchSelectedAction(_ sender: NSPopUpButton) {
    guard let controller = self.contentViewController as? ViewController else { return }
    controller.branchName = sender.itemTitle(at: sender.indexOfSelectedItem)
  }

  func openRepository() {
    guard let window = self.window,
      let controller = self.contentViewController as? ViewController
      else { return }

    let openPanel = NSOpenPanel()
    openPanel.allowsMultipleSelection = false
    openPanel.canChooseDirectories = true
    openPanel.canChooseFiles = false

    openPanel.beginSheetModal(for: window, completionHandler: { response in
      switch response {
      case .OK:
        if let url = openPanel.urls.first {
          if let repository = Repository.at(url).value,
            let branches = repository.localBranches().value,
            branches.count > 0 {
            controller.repository = repository
            controller.branchName = branches.first?.name

            self.popUpButton.removeAllItems()
            branches.forEach {
              self.popUpButton.addItem(withTitle: $0.name)
            }
            self.performBranchSelectedAction(self.popUpButton)
          } else {
            print("ERROR: could not open repository or no branches")
          }
        }
      default:
        break
      }
    })
  }
}
