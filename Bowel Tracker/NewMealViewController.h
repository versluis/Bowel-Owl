//
//  NewMealViewController.h
//  Bowel Tracker
//
//  Created by Jay Versluis on 27/08/2015.
//  Copyright (c) 2015 Pinkstone Pictures LLC. All rights reserved.
//

// Called from the NewEventViewController to create a new Meal Event.

#import <UIKit/UIKit.h>
#import "Meal.h"

@protocol MealDelegate;
@interface NewMealViewController : UIViewController

@property (nonatomic, strong) NSString *displayTitle;
@property (nonatomic, strong) Meal *meal;
@property (weak) id <MealDelegate> delegate;

@end

// Meal Protocol

@protocol MealDelegate

- (void)mealSave:(Meal *)meal;
- (void)mealCancel:(Meal *)meal;

@end