//
//  NewBowelViewController.h
//  Bowel Tracker
//
//  Created by Jay Versluis on 27/08/2015.
//  Copyright (c) 2015 Pinkstone Pictures LLC. All rights reserved.
//

// Called from the NewEventViewController to create a new Bowel Movement entry.

#import <UIKit/UIKit.h>
#import "BowelMovement.h"

@protocol BowelMovementDelegate;
@interface NewBowelViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSString *displayTitle;
@property (nonatomic, strong) BowelMovement *bowelMovement;
@property (weak) id <BowelMovementDelegate> delegate;

@end

// Bowel Movement Protocol

@protocol BowelMovementDelegate

- (void)bowelMovementSave:(BowelMovement *)bowelMovement;
- (void)bowelMovementCancel:(BowelMovement *)bowelMovement;

@end