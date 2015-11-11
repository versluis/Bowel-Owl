//
//  NewBowelViewController.m
//  Bowel Tracker
//
//  Created by Jay Versluis on 27/08/2015.
//  Copyright (c) 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "NewBowelViewController.h"

@interface NewBowelViewController ()

@property (strong, nonatomic) IBOutlet UIPickerView *bowelPicker;
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation NewBowelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set our title
    self.navigationItem.title = self.displayTitle;
    
    // create a SAVE button on the right
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveBowelMovement)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // if the back button was pressed, cancel this movement
    if (self.isMovingFromParentViewController) {
        NSLog(@"Back button was pressed.");
        [self.delegate bowelMovementCancel:self.bowelMovement];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveBowelMovement {
    
    // current date (replace with date picker later)
    self.bowelMovement.timeStamp = [NSDate date];
    
    // transfer values from text fields to managed object
    self.bowelMovement.title = self.bowelTextfield.text;
    
    // call delegate and save context
    [self.delegate bowelMovementSave:self.bowelMovement];
}

- (void)populateMovementWithValues {
    
    // create a date of "right now"
    self.bowelMovement.timeStamp = [NSDate date];
    
    // transfer values from text fields to managed object
    self.bowelMovement.notes = self.textView.text;
    
    // transfer meal picker data
    NSNumber *row = [NSNumber numberWithInteger:[self.bowelPicker selectedRowInComponent:0]];
    self.bowelMovement.title = [BowelMovement mealTitleWithStatus:row];
    
}


@end
