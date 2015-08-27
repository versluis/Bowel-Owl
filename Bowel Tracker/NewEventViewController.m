//
//  NewEventViewController.m
//  Bowel Tracker
//
//  Created by Jay Versluis on 27/08/2015.
//  Copyright (c) 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "NewEventViewController.h"

@interface NewEventViewController ()

@end

@implementation NewEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)cancelButtonPressed:(id)sender {
    
    // dismiss this view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)newMeal:(id)sender {
    
    // create a new Meal event and hold a reference to it
    
    // pass it on to the next controller
    
    // the delegate method will then save and dismiss, but for now we'll do it here
    // dismiss this view controller
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)newBowelMovement:(id)sender {
    
    // create a new BowelMovement event and hold a reference to it
    
    // pass it on to the next controller
    
    // the delegate method will then save and dismiss, but for now we'll do it here
    // dismiss this view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
