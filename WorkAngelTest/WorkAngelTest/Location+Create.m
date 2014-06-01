//
//  Location+Create.m
//  WorkAngelTest
//
//  Created by Tiago Silva on 01/06/2014.
//  Copyright (c) 2014 Tiago Silva. All rights reserved.
//

#import "Location+Create.h"
#import "WATAppDelegate.h"

@implementation Location (Create)

+ (Location *)locationWithName:(NSString *)name
{
    Location *location = nil;
    
    if ([name length]) {
        
        WATAppDelegate *appDelegate = (WATAppDelegate *)[UIApplication sharedApplication].delegate;
        NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Location"];
        request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                  ascending:YES
                                                                   selector:@selector(localizedCaseInsensitiveCompare:)]];
        request.predicate = [NSPredicate predicateWithFormat:@"name == %@", name];
        
        NSError *error;
        NSArray *matches = [appDelegate.managedObjectContext executeFetchRequest:request error:&error];
        
        if (!matches || ([matches count] > 1)) {
            // handle error
        } else if (![matches count]) {
            location = [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:managedObjectContext];
            location.name = name;
        } else {
            location = [matches lastObject];
        }
    }
    
    return location;
}

@end
