//
//  WATInstructionsViewController.m
//  WorkAngelTest
//
//  Created by Tiago Silva on 01/06/2014.
//  Copyright (c) 2014 Tiago Silva. All rights reserved.
//

#import "WATInstructionsViewController.h"

@interface WATInstructionsViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation WATInstructionsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textView.text = self.instructions;
}

@end
