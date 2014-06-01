//
//  BoardingCard+Create.h
//  WorkAngelTest
//
//  Created by Tiago Silva on 01/06/2014.
//  Copyright (c) 2014 Tiago Silva. All rights reserved.
//

#import "BoardingCard.h"

@interface BoardingCard (Create)

+ (BoardingCard *)createBoardingCardFromDictionary:(NSDictionary *)boardingCardDictionary;

@end
