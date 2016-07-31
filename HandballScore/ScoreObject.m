//
//  ScoreObject.m
//  HandballScore
//
//  Creates a score object to be stored.
//
//  Created by Steven Liao on 11/29/14.
//  Copyright (c) 2014 Steven Liao. All rights reserved.
//

#import "ScoreObject.h"

@implementation ScoreObject

// OPTIONAL CONSTRUCTOR
- (id) initWithPlayer1Name:(NSString *) player1Name
               Player2Name:(NSString *) player2Name
              Player1Score:(NSInteger) player1Score
              Player2Score:(NSInteger) player2Score
{
    return [self initWithPlayer1Name:player1Name
                         Player2Name:player2Name
                        Player1Score:player1Score
                        Player2Score:player2Score
                 Player1TimeoutsUsed:0
                 Player2TimeoutsUsed:0];
}

- (id) initWithPlayer1Name:(NSString *) player1Name
               Player2Name:(NSString *) player2Name
              Player1Score:(NSInteger) player1Score
              Player2Score:(NSInteger) player2Score
       Player1TimeoutsUsed:(NSInteger) player1TimeoutsUsed
       Player2TimeoutsUsed:(NSInteger) player2TimeoutsUsed
{
    if (self = [super init])
    {
        self.player1Name = player1Name;
        self.player2Name = player2Name;
        self.player1Score = player1Score;
        self.player2Score = player2Score;
        self.player1TimeoutsUsed = player1TimeoutsUsed;
        self.player2TimeoutsUsed = player2TimeoutsUsed;
        self.detail = [self toString];
    }
    return self;
}

/* Returns a NSString of the ScoreObject */
- (NSString *)toString
{
    return [NSString stringWithFormat:@"%@: %d \n %@: %d",
                                        self.player1Name, self.player1Score,
                                        self.player2Name, self.player2Score];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.player1Name forKey:@"p1Name"];
    [aCoder encodeObject:self.player2Name forKey:@"p2Name"];
    [aCoder encodeInteger:self.player1Score  forKey:@"p1Score"];
    [aCoder encodeInteger:self.player2Score forKey:@"p2Score"];
    [aCoder encodeInteger:self.player1TimeoutsUsed forKey:@"p1TimeoutsUsed"];
    [aCoder encodeInteger:self.player2TimeoutsUsed forKey:@"p2TimeoutsUsed"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    NSString *player1Name = [aDecoder decodeObjectForKey:@"p1Name"];
    NSString *player2Name = [aDecoder decodeObjectForKey:@"p2Name"];
    NSInteger player1Score = [aDecoder decodeIntegerForKey:@"p1Score"];
    NSInteger player2Score = [aDecoder decodeIntegerForKey:@"p2Score"];
    NSInteger player1TimeoutsUsed = [aDecoder decodeIntegerForKey:@"p1TimeoutsUsed"];
    NSInteger player2TimeoutsUsed = [aDecoder decodeIntegerForKey:@"p2TimeoutsUsed"];
    return [self initWithPlayer1Name:player1Name Player2Name:player2Name Player1Score:player1Score Player2Score:player2Score Player1TimeoutsUsed:player1TimeoutsUsed Player2TimeoutsUsed:player2TimeoutsUsed];
}

@end
