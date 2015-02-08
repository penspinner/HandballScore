//
//  ScoreTableViewController.h
//  HandballScore
//
//  Created by Steven Liao on 11/29/14.
//  Copyright (c) 2014 Steven Liao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScoreObject.h"
#import "DetailViewController.h"

@interface ScoreTableViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *objects;

- (void)loadData;

@end
