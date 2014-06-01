//
//  BoardingCard+Text.m
//  WorkAngelTest
//
//  Created by Tiago Silva on 01/06/2014.
//  Copyright (c) 2014 Tiago Silva. All rights reserved.
//

#import "BoardingCard+Text.h"
#import "Location.h"

#define type_bus @"bus"
#define type_train @"train"
#define type_airplane @"airplane"

@implementation BoardingCard (Text)

- (NSString *)instructionWithOrigin:(Location *)origin
{
    NSString *instruction = @"";
    NSMutableSet *locations = [NSMutableSet setWithSet:self.locations];
    [locations removeObject:origin];
    Location *destination = [locations anyObject];
    
    if ([self.type isEqualToString:type_train] || [self.type isEqualToString:type_bus]) {
        if ([self.type isEqualToString:type_train]) {
            instruction = [instruction stringByAppendingString:[NSString stringWithFormat:@"Take %@ %@ ", type_train, self.number]];
        } else {
            instruction = [instruction stringByAppendingString:[NSString stringWithFormat:@"Take the %@ ", type_bus]];
        }
        instruction = [instruction stringByAppendingString:[NSString stringWithFormat:@"from %@ to %@. ", origin.name, destination.name]];
        if ([self.seat length] > 0) {
            instruction = [instruction stringByAppendingString:[NSString stringWithFormat:@"Sit in seat %@. ", self.seat]];
        } else {
            instruction = [instruction stringByAppendingString:@"No seat assignment."];
        }
    } else {
        instruction = [instruction stringByAppendingString:[NSString stringWithFormat:@"From %@, take flight %@ to %@. Gate %@, seat %@. %@", origin.name, self.number, destination.name, self.gate, self.seat, self.info]];
    }
    
    return instruction;
}

- (NSString *)locationsString
{
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSArray *locations = [self.locations sortedArrayUsingDescriptors:@[sortDescriptor]];
    return [NSString stringWithFormat:@"%@ > %@", ((Location *)locations[0]).name, ((Location *)locations[1]).name];
}

- (NSString *)locationsStringWithOrigin:(Location *)origin
{
    NSMutableSet *locations = [NSMutableSet setWithSet:self.locations];
    [locations removeObject:origin];
    Location *destination = [locations anyObject];

    return [NSString stringWithFormat:@"%@ > %@", origin.name, destination.name];
}
@end
