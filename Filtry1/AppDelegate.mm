//
//  AppDelegate.m
//  Filtry1
//
//  Created by MotionVFX on 16/02/2024.
//

#import "AppDelegate.h"
#include <vector>
#include <cstdint>
#include <cmath>
#include <cstring>
using namespace std;
#define RGBA(i) (i).r,(i).g,(i).b,(i).a
typedef struct pixel_rgb{
    uint8_t r;
    uint8_t g;
    uint8_t b;
    uint8_t a;
}pixel_rgb;

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

NSString *path=@"/Users/motionvfx/Documents/kwiatek.tiff";
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
    NSDate *startTime = [NSDate date];//rozpoczecie liczenia czasu
    NSImage *image =[[NSImage alloc] initWithContentsOfFile:path];
    NSBitmapImageRep *bitmapRep = [[NSBitmapImageRep alloc] initWithData:[image TIFFRepresentation ]];
    NSInteger width = [bitmapRep pixelsWide];
    NSInteger height = [bitmapRep pixelsHigh];
    NSInteger rowBytes = [bitmapRep bytesPerRow];
    unsigned char *pixels = [bitmapRep bitmapData];
    
    
    for (NSInteger row =  0; row < height; row++) {
        unsigned char *rowStart = (unsigned char *)(pixels + (row * rowBytes));
        for (NSInteger col =  0; col < width; col++) {
            //if(filtr==0){
                unsigned char grayscale = (*rowStart *  0.3) + (*(rowStart +  1) *  0.59) + (*(rowStart +  2) *  0.11);
                *rowStart++ = grayscale; // Red
                *rowStart++ = grayscale; // Green
                *rowStart++ = grayscale; // Blue
                rowStart++;
        //    }
        //    else if(filtr==1){
          //      *rowStart++ = (255-*rowStart); // Red
          //      *rowStart++ = (255-*rowStart); // Green
          //      *rowStart++ = (255-*rowStart); // Blue
         //       rowStart++;
         //   }
        }
    }
    NSDate *endTime = [NSDate date];
    NSTimeInterval executionTime = [endTime timeIntervalSinceDate:startTime];
    NSLog(@"Czas: %f", executionTime);
    NSImage *grayScaleImage = [[NSImage alloc] initWithSize:[bitmapRep size]];
      [grayScaleImage addRepresentation:bitmapRep];
    
   [[self.window contentView]addSubview:imageView];
    imageView = [[NSImageView alloc]initWithFrame:[self.window.contentView bounds]];
    [imageView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [imageView setImage:image];
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
