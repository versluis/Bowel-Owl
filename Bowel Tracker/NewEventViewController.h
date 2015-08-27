//
//  NewEventViewController.h
//  Bowel Tracker
//
//  Created by Jay Versluis on 27/08/2015.
//  Copyright (c) 2015 Pinkstone Pictures LLC. All rights reserved.
//

// This class is called when a new event is created.
// The user is then asked what type of even he wants to create.

// This class will also hold a reference to any new object created
// and must save it to Core Data.

#import <UIKit/UIKit.h>
#import "NewBowelViewController.h"
#import "NewMealViewController.h"
#import "Meal.h"
#import "BowelMovement.h"
#import "AppDelegate.h"

@interface NewEventViewController : UIViewController <BowelMovementDelegate, MealDelegate>

@end


