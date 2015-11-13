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
    
    // transfer values from text fields to managed object
    [self populateWithValues];
    
    // call delegate and save context
    [self.delegate bowelMovementSave:self.bowelMovement];
}

- (void)populateWithValues {
    
    // create a date of "right now"
    self.bowelMovement.timeStamp = [NSDate date];
    
    // transfer values from text fields to managed object
    if ([self.textView.text isEqualToString:[BowelMovement defaultMessage]]) {
        self.bowelMovement.notes = @"";
    } else {
        self.bowelMovement.notes = self.textView.text;
    }
    
    // transfer meal picker data
    NSNumber *row = [NSNumber numberWithInteger:[self.bowelPicker selectedRowInComponent:0]];
    self.bowelMovement.status = row;
}

# pragma mark - Picker Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    // the number of meal items we have
    // defined in BowelMovement Class
    return [BowelMovement movementChoices];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    // textLabel.text = [self.mealTypes objectAtIndex:row];
    NSNumber *status = [NSNumber numberWithInteger:row];
    textLabel.text = [BowelMovement movementTitleWithStatus:status];
    return textLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    // user has chosen a meal - please react here
    NSNumber *status = [NSNumber numberWithInteger:row];
    NSString *movement = [BowelMovement movementTitleWithStatus:status];
    self.bowelMovement.title = movement;
    
}

# pragma mark - Text View Methods

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    // clear the default text
    NSString *defaultText = [BowelMovement defaultMessage];
    if ([textView.text isEqualToString:defaultText]) {
        textView.text = nil;
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    
    // check if we have some data, otherwise bring back the default text
    if (!textView.text) {
        textView.text = [BowelMovement defaultMessage];
        return;
    }
    
    
}

@end
