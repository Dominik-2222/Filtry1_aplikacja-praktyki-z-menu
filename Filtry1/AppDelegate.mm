//
//  AppDelegate.m
//  Filtry1
//
//  Created by MotionVFX on 16/02/2024.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate
bool gray_scale_switch=0,native_switch=0;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

//
- (IBAction)image_generator:(id)sender{
    
}

//obsluga switchow
- (IBAction)grayScaleSwitch_Changed:(id)sender{
    gray_scale_switch=!gray_scale_switch;
    NSLog(@"zmiana_G: %d",gray_scale_switch);
}
- (IBAction)Native_Changed:(id)sender{
    native_switch=!native_switch;
    NSLog(@"zmiana_N: %d",native_switch);
}


@end
