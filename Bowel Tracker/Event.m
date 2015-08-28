//
//  Event.m
//  Bowel Tracker
//
//  Created by Jay Versluis on 27/08/2015.
//  Copyright (c) 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "Event.h"


@implementation Event

@dynamic timeStamp;
@dynamic title;
@dynamic notes;
@dynamic status;
@dynamic daySection;

- (NSString *)daySection {
    
    // calculate a short date style from the timestamp
    // used as section in the table view
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateStyle = NSDateFormatterShortStyle;
    NSString *currentDate = [formatter stringFromDate:self.timeStamp];
    
    return currentDate;
}

@end
