//
//  Meal.m
//  Bowel Tracker
//
//  Created by Jay Versluis on 27/08/2015.
//  Copyright (c) 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "Meal.h"


@implementation Meal

+ (NSString *)mealTitleWithStatus:(NSNumber *)mealStatus {
    
    // return the type of meal as a string
    NSString *mealTitle;
    
    switch ([mealStatus integerValue]) {
        case 0:
            mealTitle = @"Breakfast";
            break;
            
            case 1:
            mealTitle = @"Lunch";
            break;
            
            case 2:
            mealTitle = @"Dinner";
            break;
            
            case 3:
            mealTitle = @"Snack";
            break;
            
        default:
            mealTitle = @"Other";
            break;
    }
    
    return mealTitle;
}

+ (int)mealChoices {
    
    // return the number of meal choices
    return 4;
}

@end
