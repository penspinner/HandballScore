//
//  DetailViewController.m
//  HandballScore
//
//  Created by Steven Liao on 12/1/14.
//  Copyright (c) 2014 Steven Liao. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"View Scores" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
//    self.navigationItem.leftBarButtonItem = backButton;
    
    [self initLabels];
    self.pasteBoardAlert = [[UIAlertView alloc]initWithTitle:@"" message:@"Copied to clipboard." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    self.pasteBoard = [UIPasteboard generalPasteboard];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initLabels
{
    self.p1NameLabel.text = [NSString stringWithFormat:@"%@", self.currentObject.player1Name];
    self.p2NameLabel.text = [NSString stringWithFormat:@"%@", self.currentObject.player2Name];
    self.p1ScoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.currentObject.player1Score];
    self.p2ScoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.currentObject.player2Score];
    self.p1TimeoutsLabel.text = [NSString stringWithFormat:@"Timeouts used: %d", self.currentObject.player1TimeoutsUsed];
    self.p2TimeoutsLabel.text = [NSString stringWithFormat:@"Timeouts used: %d", self.currentObject.player2TimeoutsUsed];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)copyToClipboard:(id)sender
{
    self.pasteBoard.string = self.currentObject.detail;
    [self.pasteBoardAlert show];
}
@end
