//
//  AppDelegate.m
//  ObjCUIApp
//
//  Created by Miklos Fazekas on 2023. 06. 08..
//

#import "AppDelegate.h"
#import <ObjCLib/ObjCLibClass.h>


@interface AppDelegate ()


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  // Insert code here to initialize your application
  [ObjCLibClass hello];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
  // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
  return YES;
}


@end
