//
//  Location.h
//  WorkAngelTest
//
//  Created by Tiago Silva on 01/06/2014.
//  Copyright (c) 2014 Tiago Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BoardingCard;

@interface Location : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *transports;
@end

@interface Location (CoreDataGeneratedAccessors)

- (void)addTransportsObject:(BoardingCard *)value;
- (void)removeTransportsObject:(BoardingCard *)value;
- (void)addTransports:(NSSet *)values;
- (void)removeTransports:(NSSet *)values;

@end
