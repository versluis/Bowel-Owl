//
//  NewMealViewController.m
//  Bowel Tracker
//
//  Created by Jay Versluis on 27/08/2015.
//  Copyright (c) 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "NewMealViewController.h"

@interface NewMealViewController () <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *mealTitle;
@property (strong, nonatomic) IBOutlet UITextField *mealTextField;
@property (strong, nonatomic) IBOutlet UITextView *mealTextView;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UIPickerView *mealPicker;
@property (strong, nonatomic) NSArray *mealTypes;

@end

@implementation NewMealViewController

# pragma mark - Custom Initialisers

- (NSArray *)mealTypes {
    
    // defining what types of meals can be chosen by the picker
    if (!_mealTypes) {
        _mealTypes = @[@"Breakfast", @"Lunch", @"Dinner", @"Snack"];
    }
    
    return _mealTypes;
}

# pragma mark - View Controller Logic

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set our title
    self.navigationItem.title = self.displayTitle;
    
    // create a SAVE button on the right
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveMeal)];
    self.navigationItem.rightBarButtonItem = saveButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveMeal {
    
    // called from bar button item made in code (viewDidLoad)
    
    // transfer values to our meal
    [self populateMealWithValues];
    
    // call delegate and save context
    [self.delegate mealSave:self.meal];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // if the back button was pressed, cancel this meal
    if (self.isMovingFromParentViewController) {
        NSLog(@"Back button was pressed.");
        [self.delegate mealCancel:self.meal];
    }
}

- (void)populateMealWithValues {
    
    // create a date of "right now"
    self.meal.timeStamp = [NSDate date];
    
    // transfer values from text fields to managed object
    // self.meal.title = self.mealTextField.text;
    self.meal.notes = self.mealTextView.text;
    
    // transfer meal picker data
    NSInteger row = [self.mealPicker selectedRowInComponent:0];
    self.meal.title = [self.mealTypes objectAtIndex:row];
    
}

# pragma mark - Picker Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.mealTypes.count;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    textLabel.text = [self.mealTypes objectAtIndex:row];
    return textLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    // user has chosen a meal - please react here
    
    NSString *currentMealType = [self.mealTypes objectAtIndex:row];
    self.meal.title = currentMealType;

}

# pragma mark - Text View Methods

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    // clear the default text
    NSString *defaultText = @"What did you have?";
    if ([textView.text isEqualToString:defaultText]) {
        textView.text = nil;
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    
    // check if we have some data, otherwise bring back the default text
    if (!textView.text) {
        textView.text = @"What did you have?";
        return;
    }
    
    
}


@end
