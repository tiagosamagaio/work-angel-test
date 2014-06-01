//
//  WATPlanViewController.m
//  WorkAngelTest
//
//  Created by Tiago Silva on 01/06/2014.
//  Copyright (c) 2014 Tiago Silva. All rights reserved.
//

#import "WATPlanViewController.h"
#import "WATInstructionsViewController.h"
#import "BoardingCard+Text.h"

@interface WATPlanViewController ()

@end

@implementation WATPlanViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.boardingCards = [self.plan objectForKey:@"boardingCards"];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BoardingCard" forIndexPath:indexPath];
    
    BoardingCard *boardingCard = self.boardingCards[indexPath.row];
    cell.textLabel.text = [boardingCard locationsStringWithOrigin:[self.plan objectForKey:@"locations"][indexPath.row]];
    cell.detailTextLabel.text = boardingCard.type;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WATInstructionsViewController *viewController = (WATInstructionsViewController *)segue.destinationViewController;
    viewController.instructions = [self.plan objectForKey:@"instructions"];
}

@end
