//
//  Journey+Text.m
//  WorkAngelTest
//
//  Created by Tiago Silva on 01/06/2014.
//  Copyright (c) 2014 Tiago Silva. All rights reserved.
//

#import "Journey+Text.h"
#import "BoardingCard+Text.h"

@implementation Journey (Text)

+ (NSString *)instructionsForPlan:(NSDictionary *)plan
{
    NSString *instructions = @"";
    
    NSArray *boardingCards = [plan objectForKey:@"boardingCards"];
    NSArray *locations = [plan objectForKey:@"locations"];
    
    for (int i=0; i<[boardingCards count]; i++) {
        if (i != 0) {
            instructions = [instructions stringByAppendingString:@"/n/n"];
        }
        BoardingCard *boardingCard = boardingCards[i];
        Location *location = locations[i];
        instructions = [instructions stringByAppendingString:[boardingCard instructionWithOrigin:location]];
    }
    
    instructions = [instructions stringByAppendingString:@"You have arrived at your final destination."];
    
    return instructions;
}

@end
