//
//  MainViewController.h
//  HandballScore
//
//  Created by Steven Liao on 11/29/14.
//  Copyright (c) 2014 Steven Liao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScoreObject.h"
#import "TimeoutViewController.h"

@interface MainViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) ScoreObject *currentObject;

@property (weak, nonatomic) IBOutlet UITextField *player1NameTextField;
@property (weak, nonatomic) IBOutlet UITextField *player2NameTextField;
@property (weak, nonatomic) IBOutlet UILabel *player1ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *player1TimeoutLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2TimeoutLabel;

@property (nonatomic, assign) NSInteger player1Score;
@property (nonatomic, assign) NSInteger player2Score;
@property (nonatomic, assign) NSInteger player1Timeouts;
@property (nonatomic, assign) NSInteger player2Timeouts;
@property (nonatomic, strong) UIAlertView *timeoutAlert;
@property (nonatomic, strong) UIAlertView *resetAlert;

// ACTIONS
- (IBAction)incPlayer1Score:(id)sender;
- (IBAction)decPlayer1Score:(id)sender;
- (IBAction)incPlayer2Score:(id)sender;
- (IBAction)decPlayer2Score:(id)sender;
- (IBAction)usePlayer1Timeout:(id)sender;
- (IBAction)usePlayer2Timeout:(id)sender;

// RESET AND SAVE
- (IBAction)resetMatch:(id)sender;
- (IBAction)saveMatch:(id)sender;


@end
