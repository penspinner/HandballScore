//
//  TimeoutViewController.m
//  HandballScore
//
//  Created by Steven Liao on 11/29/14.
//  Copyright (c) 2014 Steven Liao. All rights reserved.
//

#import "TimeoutViewController.h"

@interface TimeoutViewController ()

@end

@implementation TimeoutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initLabels];
    
    self.timeoutTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initLabels
{
    self.timeoutLabel.text = [NSString stringWithFormat:@"%@'s Timeout", self.playerName];
    self.sec = 60;
    self.timerLabel.text = @"60";
}

- (void)updateTimer
{
    if (self.sec == 0)
    {
        [self stopTimer];
        self.timerLabel.text = @"Time is up!";
        return;
    }
    
    self.timerLabel.text = [NSString stringWithFormat:@"%d", --self.sec];
}

- (void)stopTimer
{
    [self.timeoutTimer invalidate];
    self.timeoutTimer = nil;
}

- (IBAction)resumePlayButton:(id)sender
{
    [self stopTimer];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
