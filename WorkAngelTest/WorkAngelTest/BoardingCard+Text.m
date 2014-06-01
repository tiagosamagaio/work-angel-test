//
//  BoardingCard+Text.m
//  WorkAngelTest
//
//  Created by Tiago Silva on 01/06/2014.
//  Copyright (c) 2014 Tiago Silva. All rights reserved.
//

#import "BoardingCard+Text.h"
#import "Location.h"

#define type_airportbus @"airport bus"
#define type_train @"train"
#define type_airplane @"airplane"

@implementation BoardingCard (Text)

- (NSString *)instructionWithOrigin:(Location *)origin
{
    NSString *instruction = @"";
    NSMutableSet *locations = [NSMutableSet setWithSet:self.locations];
    [locations removeObject:origin];
    Location *destination = [locations anyObject];
    
    if ([self.type isEqualToString:type_train] || [self.type isEqualToString:type_airportbus]) {
        if ([self.type isEqualToString:type_train]) {
            instruction = [instruction stringByAppendingString:[NSString stringWithFormat:@"Take %@ %@ ", type_train, self.number]];
        } else {
            instruction = [instruction stringByAppendingString:[NSString stringWithFormat:@"Take the %@ ", type_airportbus]];
        }
        instruction = [instruction stringByAppendingString:[NSString stringWithFormat:@"from %@ to %@. ", origin.name, destination.name]];
        if (self.seat) {
            instruction = [instruction stringByAppendingString:[NSString stringWithFormat:@"Sit in seat %@. ", self.seat]];
        } else {
            instruction = [instruction stringByAppendingString:@"No seat assignment."];
        }
    } else {
        instruction = [instruction stringByAppendingString:[NSString stringWithFormat:@"From %@, take flight %@ to %@. Gate %@, seat %@. %@", origin.name, self.number, destination.name, self.gate, self.seat, self.info]];
    }
    
    return instruction;
}

@end
