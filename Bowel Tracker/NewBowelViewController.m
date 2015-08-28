//
//  NewBowelViewController.m
//  Bowel Tracker
//
//  Created by Jay Versluis on 27/08/2015.
//  Copyright (c) 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "NewBowelViewController.h"

@interface NewBowelViewController ()

@property (strong, nonatomic) IBOutlet UITextField *bowelTextfield;

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


@end
