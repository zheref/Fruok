//
//  AppDelegate.swift
//  Fruok
//
//  Created by Sergio Daniel L. García on 4/5/17.
//  Copyright © 2017 Sergio Daniel L. García. All rights reserved.
//

import Cocoa
import SwiftyBeaver


let log = SwiftyBeaver.self


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        configLog()
    }
    
    private func configLog() {
        let platform = SBPlatformDestination(appID: "r7xYVB",
                                             appSecret: "ifNkbnpFsgox6na6kD1nfyn9vpaxgq8i",
                                             encryptionKey: "I1cbl1iTw2xyntwv1o5rvo5828S8hyx8")
        
        log.addDestination(platform)
        log.addDestination(ConsoleDestination())
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool {
        return true
    }
    
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        return true
    }


}

