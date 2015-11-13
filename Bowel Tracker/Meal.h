//
//  Meal.h
//  Bowel Tracker
//
//  Created by Jay Versluis on 27/08/2015.
//  Copyright (c) 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Event.h"


@interface Meal : Event

+ (NSString *)mealTitleWithStatus:(NSNumber *)mealStatus;
+ (NSString *)defaultMessage;
+ (int)mealChoices;

@end
