//
//  DHViewController.m
//  FlashTranslator
//
//  Created by binaryboy on 6/18/14.
//  Copyright (c) 2014 AhmedHamdy. All rights reserved.
//

#import "DHViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface DHViewController ()

@end

@implementation DHViewController
@synthesize txt;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)exit{
    exit(0);
}
- (IBAction)translate:(id)sender {
    if (TARGET_IPHONE_SIMULATOR) {
        [[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Run the Demo in Real Device" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil]show];
        
        [self performSelector:@selector(exit) withObject:nil afterDelay:1000];
    }
   NSString*txtString =txt.text;
    //NSLog(@"%@",binaryString);

    NSMutableString*binaryResultString=[[NSMutableString alloc]init];
    for (NSInteger charIdx=0; charIdx<txtString.length; charIdx++){
        // Do something with character at index charIdx, for example:
        int asc = [txtString characterAtIndex:charIdx];
        [binaryResultString appendString:[self toBinary:asc]];
    }

    NSLog(@"%@",binaryResultString);
    [self BinaryToFlash:binaryResultString];
}

-(NSString *)toBinary:(int)num{
    if (num == 1 || num == 0)
        return [NSString stringWithFormat:@"%u", num];
    return [NSString stringWithFormat:@"%@%u", [self toBinary:num / 2], num % 2];
}

-(void)BinaryToFlash:(NSString *)binaryString{
    
    for (NSInteger charIdx=0; charIdx<binaryString.length; charIdx++){
        // Do something with character at index charIdx, for example:
        int asc = [binaryString characterAtIndex:charIdx];
        if (1==asc)
            [self turnTorchOn:YES];
        else
            [self turnTorchOn:NO];
        
    }
}


- (void) turnTorchOn: (bool) on {
    
    // check if flashlight available
    Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
    if (captureDeviceClass != nil) {
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch] && [device hasFlash]){
            
            [device lockForConfiguration:nil];
            if (on) {
                [device setTorchMode:AVCaptureTorchModeOn];
                [device setFlashMode:AVCaptureFlashModeOn];
                //torchIsOn = YES; //define as a variable/property if you need to know status
            } else {
                [device setTorchMode:AVCaptureTorchModeOff];
                [device setFlashMode:AVCaptureFlashModeOff];
                //torchIsOn = NO;
            }
            [device unlockForConfiguration];
        }
    } }

@end
