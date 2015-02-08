//
//  MainViewController.m
//  HandballScore
//
//  Created by Steven Liao on 11/29/14.
//  Copyright (c) 2014 Steven Liao. All rights reserved.
//

#import "MainViewController.h"
#import <math.h>

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // DECLARE THE DELEGATES TO SELF
    self.player1NameTextField.delegate = self;
    self.player2NameTextField.delegate = self;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(returnKeyboard)];
    [self.view addGestureRecognizer:tapGesture];

    [self initData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)returnKeyboard
{
    [self.player1NameTextField resignFirstResponder];
    [self.player2NameTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [self reset];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller
}

- (void)initData
{
    self.currentObject = [[ScoreObject alloc] init];
    self.player1Score = 0;
    self.player2Score = 0;
    self.player1Timeouts = 3;
    self.player2Timeouts = 3;
    self.player1TimeoutLabel.text = [NSString stringWithFormat:@"Timeouts: %d", self.player1Timeouts];
    self.player2TimeoutLabel.text = [NSString stringWithFormat:@"Timeouts: %d", self.player2Timeouts];
    self.player1ScoreLabel.adjustsFontSizeToFitWidth = YES;
    self.player2ScoreLabel.adjustsFontSizeToFitWidth = YES;
    self.player1ScoreLabel.minimumScaleFactor = 0;
    self.player2ScoreLabel.minimumScaleFactor = 0;
    self.player1TimeoutLabel.adjustsFontSizeToFitWidth = YES;
    self.player2TimeoutLabel.adjustsFontSizeToFitWidth = YES;
    self.player1TimeoutLabel.minimumScaleFactor = 0;
    self.player2TimeoutLabel.minimumScaleFactor = 0;
    
    self.timeoutAlert = [[UIAlertView alloc]initWithTitle:@"" message:@"NO MORE TIMEOUTS LEFT." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    self.resetAlert = [[UIAlertView alloc]initWithTitle:@"" message:@"Are you sure you want to reset all fields?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
}

- (void)initCurrentObject
{
    self.currentObject.player1Name = self.player1NameTextField.text;
    self.currentObject.player2Name = self.player2NameTextField.text;
    self.currentObject.player1Score = self.player1Score;
    self.currentObject.player2Score = self.player2Score;
    self.currentObject.player1TimeoutsUsed = abs(self.player1Timeouts - 3);
    self.currentObject.player2TimeoutsUsed = abs(self.player2Timeouts - 3);
}

- (IBAction)incPlayer1Score:(id)sender
{
    NSString *newScore = [NSString stringWithFormat:@"%d", ++self.player1Score];
    self.player1ScoreLabel.text = newScore;
}

- (IBAction)decPlayer1Score:(id)sender
{
    NSString *newScore = [NSString stringWithFormat:@"%d", --self.player1Score];
    self.player1ScoreLabel.text = newScore;
}

- (IBAction)incPlayer2Score:(id)sender
{
    NSString *newScore = [NSString stringWithFormat:@"%d", ++self.player2Score];
    self.player2ScoreLabel.text = newScore;
}

- (IBAction)decPlayer2Score:(id)sender
{
    NSString *newScore = [NSString stringWithFormat:@"%d", --self.player2Score];
    self.player2ScoreLabel.text = newScore;
}

- (IBAction)usePlayer1Timeout:(id)sender
{
    if (self.player1Timeouts - 1 >= 0)
    {
        TimeoutViewController *timeoutViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TimeoutViewController"];
        timeoutViewController.playerName = self.player1NameTextField.text;
        [self presentViewController:timeoutViewController animated:YES completion:nil];
        self.player1TimeoutLabel.text = [NSString stringWithFormat:@"Timeouts: %d", --self.player1Timeouts];
    } else
    {
        [self.timeoutAlert show];
    }
}

- (IBAction)usePlayer2Timeout:(id)sender
{
    if (self.player1Timeouts - 1 >= 0)
    {
        TimeoutViewController *timeoutViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TimeoutViewController"];
        timeoutViewController.playerName = self.player2NameTextField.text;
        [self presentViewController:timeoutViewController animated:YES completion:nil];
        self.player2TimeoutLabel.text = [NSString stringWithFormat:@"Timeouts: %d", --self.player2Timeouts];
    } else
    {
        [self.timeoutAlert show];
    }
}

- (IBAction)resetMatch:(id)sender
{
    [self.resetAlert show];
}

- (void)reset
{
    self.player1Score = 0;
    self.player2Score = 0;
    self.player1Timeouts = 3;
    self.player2Timeouts = 3;
    
    self.player1NameTextField.text = @"";
    self.player2NameTextField.text = @"";
    self.player1ScoreLabel.text = @"0";
    self.player2ScoreLabel.text = @"0";
    self.player1TimeoutLabel.text = @"Timeouts: 3";
    self.player2TimeoutLabel.text = @"Timeouts: 3";
}

- (IBAction)saveMatch:(id)sender
{
    if ([self arePlayerNamesFilled])
    {
        [self initCurrentObject];
        [self save];
//        [self saveNSUserDefaults];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"SAVED" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    } else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please enter names for both players." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

- (BOOL)arePlayerNamesFilled
{
    if ([self.player1NameTextField.text isEqualToString:@""] ||
        [self.player2NameTextField.text
         isEqualToString:@""])
    {
        return NO;
    }
    return YES;
}

- (void)saveNSUserDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *array = [defaults objectForKey:@"Scores Array"];
    if (array == nil) array = [[NSMutableArray alloc] init];
    
    [array addObject:self.currentObject];
    [defaults removeObjectForKey:@"Scores Array"];
    [defaults setObject:array forKey:@"Scores Array"];
}

- (void)save
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    // OBTAIN THE PATH TO SAVE THE OBJECT AT
    NSString *path = [self getPath:fileManager error:error];
    
    // AN ARRAY OF THE SCOREOBJECT TO DISPLAY
    NSMutableArray *rootObject = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    if (rootObject == nil)  rootObject = [[NSMutableArray alloc]init];
    // ADD THE CURRENT SCOREOBJECT
    [rootObject addObject:self.currentObject];
    // SAVE IT INTO THE PATH
    [NSKeyedArchiver archiveRootObject:rootObject toFile:path];
}

- (NSString *)getPath:(NSFileManager *)fileManager error:(NSError *)error
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    if ([fileManager fileExistsAtPath:documentsDirectory] == NO)
    {
        [fileManager createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:@"Match Data"];
    
    return documentsDirectory;
}

@end
