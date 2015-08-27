//
//  NewMealViewController.m
//  Bowel Tracker
//
//  Created by Jay Versluis on 27/08/2015.
//  Copyright (c) 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "NewMealViewController.h"

@interface NewMealViewController ()

@property (strong, nonatomic) IBOutlet UILabel *mealTitle;
@property (strong, nonatomic) IBOutlet UITextField *mealTextField;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;


@end

@implementation NewMealViewController

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

- (void)saveMeal {
    
    // current date (replace with date picker later)
    self.meal.timeStamp = [NSDate date];
    
    // transfer values from text fields to managed object
    self.meal.title = self.mealTextField.text;
    
    // call delegate and save context
    [self.delegate mealSave:self.meal];
}


@end
