//
//  DetailViewController.h
//  HandballScore
//
//  Created by Steven Liao on 12/1/14.
//  Copyright (c) 2014 Steven Liao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScoreObject.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) ScoreObject *currentObject;
@property (nonatomic, strong) UIPasteboard *pasteBoard;
@property (nonatomic, strong) UIAlertView *pasteBoardAlert;
@property (nonatomic, copy) NSString *title;

@property (weak, nonatomic) IBOutlet UILabel *p1NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *p2NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *p1ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *p2ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *p1TimeoutsLabel;
@property (weak, nonatomic) IBOutlet UILabel *p2TimeoutsLabel;
- (IBAction)copyToClipboard:(id)sender;

@end
