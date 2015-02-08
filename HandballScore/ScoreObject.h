//
//  ScoreObject.h
//  HandballScore
//
//  Created by Steven Liao on 11/29/14.
//  Copyright (c) 2014 Steven Liao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScoreObject : NSObject <NSCoding>

@property (nonatomic, strong) NSString *player1Name;
@property (nonatomic, strong) NSString *player2Name;
@property (nonatomic, assign) NSInteger player1Score;
@property (nonatomic, assign) NSInteger player2Score;
@property (nonatomic, assign) NSInteger player1TimeoutsUsed;
@property (nonatomic, assign) NSInteger player2TimeoutsUsed;
@property (nonatomic, strong) NSString *detail;

@end
