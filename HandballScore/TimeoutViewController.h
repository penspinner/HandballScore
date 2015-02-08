//
//  TimeoutViewController.h
//  HandballScore
//
//  Created by Steven Liao on 11/29/14.
//  Copyright (c) 2014 Steven Liao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeoutViewController : UIViewController

@property (nonatomic, strong) NSTimer *timeoutTimer;
@property (nonatomic, strong) NSString *playerName;
@property (nonatomic, assign) NSInteger sec;

@property (weak, nonatomic) IBOutlet UILabel *timeoutLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

- (IBAction)resumePlayButton:(id)sender;

@end
