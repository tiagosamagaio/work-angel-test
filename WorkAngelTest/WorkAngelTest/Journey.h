//
//  Journey.h
//  WorkAngelTest
//
//  Created by Tiago Silva on 01/06/2014.
//  Copyright (c) 2014 Tiago Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BoardingCard, Location;

@interface Journey : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *boardingCards;
@property (nonatomic, retain) NSSet *locations;
@end

@interface Journey (CoreDataGeneratedAccessors)

- (void)addBoardingCardsObject:(BoardingCard *)value;
- (void)removeBoardingCardsObject:(BoardingCard *)value;
- (void)addBoardingCards:(NSSet *)values;
- (void)removeBoardingCards:(NSSet *)values;

- (void)addLocationsObject:(Location *)value;
- (void)removeLocationsObject:(Location *)value;
- (void)addLocations:(NSSet *)values;
- (void)removeLocations:(NSSet *)values;

@end
