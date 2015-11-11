//
//  DetailViewController.m
//  Bowel Tracker
//
//  Created by Jay Versluis on 27/08/2015.
//  Copyright (c) 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "DetailViewController.h"
#import "Event.h"
#import "Meal.h"
#import "BowelMovement.h"

@interface DetailViewController ()

@property (strong, nonatomic) Event *event;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        self.event = (Event *)_detailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureView {
    
    // Update the user interface for the detail item.
    if (self.detailItem) {
        
        self.label1.text = [self getEventTitle];
        self.label2.text = [self getEventSubtitle];
        self.textView.text = [self getEventNotes];
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
    }
}

- (NSString *)getEventTitle {
    
    // figure out what type of event this is and extract its title
    NSString *eventTitle;
    
    if ([self.event isKindOfClass:Meal.class]) {
        // it's a meal, return the type
        eventTitle = self.event.title;
    } else {
        // it's a Bowel Movement
        eventTitle = @"Bowel Movement";
    }
    return eventTitle;
}

- (NSString *)getEventSubtitle {
    
    // extract the event's date
    NSString *eventSubtitle;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateStyle = NSDateFormatterShortStyle;
    formatter.timeStyle = NSDateFormatterNoStyle;
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc]init];
    formatter2.dateStyle = NSDateFormatterNoStyle;
    formatter2.timeStyle = NSDateFormatterShortStyle;
    
    NSString *theDate = [formatter stringFromDate:self.event.timeStamp];
    NSString *theTime = [formatter2 stringFromDate:self.event.timeStamp];
    
    eventSubtitle = [NSString stringWithFormat:@"%@ at %@", theDate, theTime];
    
    return eventSubtitle;
}

- (NSString *)getEventNotes {
    
    // extract notes from this event
    NSString *notes;
    
    if ([self.event isKindOfClass:Meal.class]) {
        // it's a meal, return the type
        notes = self.event.notes;
    } else {
        // it's a Bowel Movement
        
        NSString *status = [BowelMovement movementTitleWithStatus:self.event.status];
        notes = [NSString stringWithFormat:@"%@\n\n%@", status, self.event.notes];
    }
    return notes;
}

- (IBAction)editButtonPressed:(id)sender {
    
    // bring up the relevant edit controller, depending on source class
}

@end
