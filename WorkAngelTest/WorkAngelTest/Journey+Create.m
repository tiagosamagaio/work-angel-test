//
//  Journey+Create.m
//  WorkAngelTest
//
//  Created by Tiago Silva on 01/06/2014.
//  Copyright (c) 2014 Tiago Silva. All rights reserved.
//

#import "Journey+Create.h"
#import "WATAppDelegate.h"
#import "BoardingCard+Create.h"

@implementation Journey (Create)

+ (Journey *)createJourneyWithDictionary:(NSDictionary *)journeyDictionary
{
    Journey *journey = nil;
    
    WATAppDelegate *appDelegate = (WATAppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    
    journey = [NSEntityDescription insertNewObjectForEntityForName:@"Journey" inManagedObjectContext:managedObjectContext];
    journey.name = [journeyDictionary objectForKey:@"name"];
    
    for (NSDictionary *boardingCardDictionary in [journeyDictionary objectForKey:@"boardingCards"]) {
        BoardingCard *boardingCard = [BoardingCard createBoardingCardFromDictionary:boardingCardDictionary];
        if (boardingCard) {
            [journey addBoardingCardsObject:boardingCard];
            [journey addLocations:boardingCard.locations];
        }
    }
    
    return journey;
}

@end
