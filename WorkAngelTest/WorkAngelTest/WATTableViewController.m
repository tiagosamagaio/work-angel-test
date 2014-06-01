//
//  WATTableViewController.m
//  WorkAngelTest
//
//  Created by Tiago Silva on 01/06/2014.
//  Copyright (c) 2014 Tiago Silva. All rights reserved.
//

#import "WATTableViewController.h"
#import "BoardingCard+Text.h"

@interface WATTableViewController ()

@end

@implementation WATTableViewController

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.boardingCards count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BoardingCard" forIndexPath:indexPath];
    
    BoardingCard *boardingCard = self.boardingCards[indexPath.row];
    cell.textLabel.text = [boardingCard locationsString];
    cell.detailTextLabel.text = boardingCard.type;
    
    return cell;
}

@end
