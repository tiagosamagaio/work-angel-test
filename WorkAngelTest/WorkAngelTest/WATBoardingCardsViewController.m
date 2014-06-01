//
//  WATBoardingCardsViewController.m
//  WorkAngelTest
//
//  Created by Tiago Silva on 01/06/2014.
//  Copyright (c) 2014 Tiago Silva. All rights reserved.
//

#import "WATBoardingCardsViewController.h"
#import "Journey+Create.h"
#import "Journey+Sorting.h"
#import "WATPlanViewController.h"

@interface WATBoardingCardsViewController ()

@property (strong, nonatomic) Journey *journey;

@end

@implementation WATBoardingCardsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *journeyDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:nil];
    self.journey = [Journey createJourneyWithDictionary:journeyDictionary];
    self.boardingCards = [self.journey boardingCardsArray];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WATPlanViewController *viewController = (WATPlanViewController *)segue.destinationViewController;
    viewController.plan = [self.journey plan];
}

@end
