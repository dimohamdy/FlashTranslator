//
//  DHViewController.h
//  FlashTranslator
//
//  Created by binaryboy on 6/18/14.
//  Copyright (c) 2014 AhmedHamdy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHViewController : UIViewController
- (IBAction)translate:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txt;
@property (strong, nonatomic) IBOutlet UILabel *lbl1;
@property (strong, nonatomic) IBOutlet UILabel *lbl2;

@property (strong, nonatomic) IBOutlet UIButton *btn;
@end
