//
//  Journey+Sorting.m
//  WorkAngelTest
//
//  Created by Tiago Silva on 01/06/2014.
//  Copyright (c) 2014 Tiago Silva. All rights reserved.
//

#import "Journey+Sorting.h"
#import "Location.h"
#import "BoardingCard+Text.h"

@implementation Journey (Sorting)

- (NSDictionary *)plan
{
    NSMutableArray *sortedBoardingCards = [NSMutableArray array];
    NSMutableArray *sortedLocations = [NSMutableArray array];
    NSString *instructions = @"";
    
    Location *origin;

    for (Location *location in self.locations) {
        if ([location.boardingCards count] == 1) {
            origin = location;
            BoardingCard *firstBoardingCard = [location.boardingCards anyObject];
            [sortedBoardingCards addObject:firstBoardingCard];
            [sortedLocations addObject:origin];
            instructions = [instructions stringByAppendingString:[firstBoardingCard instructionWithOrigin:origin]];
            break;
        }
    }
    
    while ([sortedBoardingCards count] != [self.boardingCards count]) {
        BoardingCard *boardingCard = [sortedBoardingCards lastObject];
        NSMutableSet *locations = [NSMutableSet setWithSet:boardingCard.locations];
        [locations removeObject:origin];
        Location *destination = [locations anyObject];
        for (BoardingCard *nextBoardingCard in destination.boardingCards) {
            if (nextBoardingCard != boardingCard) {
                [sortedBoardingCards addObject:nextBoardingCard];
                origin = destination;
                [sortedLocations addObject:origin];
                instructions = [instructions stringByAppendingString:@"\n\n"];
                instructions = [instructions stringByAppendingString:[nextBoardingCard instructionWithOrigin:origin]];
                break;
            }
        }
    }
    
    instructions = [instructions stringByAppendingString:@"\n\nYou have arrived at your final destination."];
    
    return @{@"boardingCards":sortedBoardingCards, @"instructions":instructions, @"locations":sortedLocations};
}

- (NSArray *)boardingCardsArray
{
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"type" ascending:NO];
    return [self.boardingCards sortedArrayUsingDescriptors:@[sortDescriptor]];
}

@end
