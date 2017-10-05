//
//  WindowController.swift
//  Apricot
//
//  Created by Donny Kurniawan on 3/10/17.
//  Copyright © 2017 Donny Kurniawan. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
  override func windowDidLoad() {
    super.windowDidLoad()
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
          }
        }
      default:
        break
      }
    })
  }
}
