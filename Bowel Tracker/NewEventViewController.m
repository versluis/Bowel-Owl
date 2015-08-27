//
//  NewEventViewController.m
//  Bowel Tracker
//
//  Created by Jay Versluis on 27/08/2015.
//  Copyright (c) 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "NewEventViewController.h"

@interface NewEventViewController ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation NewEventViewController

#pragma mark - Custom Inintialisers

- (NSManagedObjectContext *)managedObjectContext {
    
    if (!_managedObjectContext) {
        AppDelegate *myAppDelegate = [UIApplication sharedApplication].delegate;
        _managedObjectContext = myAppDelegate.managedObjectContext;
    }
    return _managedObjectContext;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - Button Logic

- (IBAction)cancelButtonPressed:(id)sender {
    
    // dismiss this view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)newMeal:(id)sender {
    
    // create a new Meal event and hold a reference to it
    Meal *newMeal = [NSEntityDescription insertNewObjectForEntityForName:@"Meal" inManagedObjectContext:self.managedObjectContext];
    
    // pass it on to the next controller
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NewMealViewController *mealView = [storyboard instantiateViewControllerWithIdentifier:@"MealView"];
    mealView.delegate = self;
    mealView.displayTitle = @"New Meal";
    mealView.meal = newMeal;
    
    [self.navigationController pushViewController:mealView animated:YES];
    
    // the delegate method will then save and dismiss, but for now we'll do it here
    // dismiss this view controller
    // [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)newBowelMovement:(id)sender {
    
    // create a new BowelMovement event and hold a reference to it
    BowelMovement *newBowelMovement = [NSEntityDescription insertNewObjectForEntityForName:@"BowelMovement" inManagedObjectContext:self.managedObjectContext];
    
    // pass it on to the next controller
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NewBowelViewController *bowelView = [storyboard instantiateViewControllerWithIdentifier:@"BowelView"];
    bowelView.delegate = self;
    bowelView.displayTitle = @"New Bowel Movement";
    bowelView.bowelMovement = newBowelMovement;
 
    [self.navigationController pushViewController:bowelView animated:YES];
    
    
    // the delegate method will then save and dismiss, but for now we'll do it here
    // dismiss this view controller
    // [self dismissViewControllerAnimated:YES completion:nil];
}


# pragma mark - Delegate Implementations

- (void)mealSave:(Meal *)meal {
    
    // save meal to current context
    AppDelegate *myAppDelegate = [UIApplication sharedApplication].delegate;
    [myAppDelegate saveContext];
    
    // and dismiss this view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)mealCancel:(Meal *)meal {
    
    // remove meal
    
    // and dismiss this view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)bowelMovementSave:(BowelMovement *)bowelMovement {
    
    // save context
    
    // and dismiss this view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)bowelMovementCancel:(BowelMovement *)bowelMovement {
    
    // remove item from context
    
    // and dismiss this view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end









