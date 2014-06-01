//
//  BoardingCard.h
//  WorkAngelTest
//
//  Created by Tiago Silva on 01/06/2014.
//  Copyright (c) 2014 Tiago Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location;

@interface BoardingCard : NSManagedObject

@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * number;
@property (nonatomic, retain) NSString * seat;
@property (nonatomic, retain) NSString * info;
@property (nonatomic, retain) NSSet *locations;
@end

@interface BoardingCard (CoreDataGeneratedAccessors)

- (void)addLocationsObject:(Location *)value;
- (void)removeLocationsObject:(Location *)value;
- (void)addLocations:(NSSet *)values;
- (void)removeLocations:(NSSet *)values;

@end
