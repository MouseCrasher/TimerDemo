//
//  MPViewController.h
//  TimerDemo
//
//  Created by infoshore on 17/12/12.
//  Copyright (c) 2012 infoshore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPViewController : UIViewController
{
    UILabel *label;
    UILabel *labelTimer;
    
    NSDateFormatter *dateFormatter;
    NSTimer *pollingtimer;
}
- (IBAction)start:(id)sender;
- (void)showLabel;
- (void)hideLabel;
@end
