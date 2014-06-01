//
//  BoardingCard+Create.m
//  WorkAngelTest
//
//  Created by Tiago Silva on 01/06/2014.
//  Copyright (c) 2014 Tiago Silva. All rights reserved.
//

#import "BoardingCard+Create.h"
#import "WATAppDelegate.h"
#import "Location+Create.h"

@implementation BoardingCard (Create)

+ (BoardingCard *)createBoardingCardFromDictionary:(NSDictionary *)boardingCardDictionary
{
    BoardingCard *boardingCard = nil;
    
    WATAppDelegate *appDelegate = (WATAppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    
    boardingCard = [NSEntityDescription insertNewObjectForEntityForName:@"BoardingCard" inManagedObjectContext:managedObjectContext];
    boardingCard.type = [boardingCardDictionary objectForKey:@"type"];
    boardingCard.number = [boardingCardDictionary objectForKey:@"number"];
    boardingCard.seat = [boardingCardDictionary objectForKey:@"seat"];
    boardingCard.gate = [boardingCardDictionary objectForKey:@"gate"];
    boardingCard.info = [boardingCardDictionary objectForKey:@"info"];
    
    for (NSString *locationName in [boardingCardDictionary objectForKey:@"locations"]) {
        Location *location = [Location locationWithName:locationName];
        if (location) [boardingCard addLocationsObject:location];
    }
    
    return boardingCard;
}

@end
