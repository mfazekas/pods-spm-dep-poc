//
//  AppDelegate.swift
//  SwiftUIApp
//
//  Created by Miklos Fazekas on 2023. 06. 09..
//

import Cocoa

import SwiftLib

@main
class AppDelegate: NSObject, NSApplicationDelegate {

  


  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Insert code here to initialize your application
    let v = SwiftLibClass()
    v.hello()
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }

  func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }


}

