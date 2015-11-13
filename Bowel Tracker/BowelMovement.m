//
//  BowelMovement.m
//  Bowel Tracker
//
//  Created by Jay Versluis on 27/08/2015.
//  Copyright (c) 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "BowelMovement.h"


@implementation BowelMovement

+ (NSString *)movementTitleWithStatus:(NSNumber *)bowelStatus {
    
    // list of choices for Bowel Movements
    NSString *bowelTitle;
    
    switch ([bowelStatus integerValue]) {
        case 0:
            bowelTitle = @"Super Hard Lumps";
            break;
            
            case 1:
            bowelTitle = @"Lumpy Sausage";
            break;
            
            case 2:
            bowelTitle = @"Hard Sausage";
            break;
            
           case 3:
            bowelTitle = @"Soft Sausage";
            break;
            
            case 4:
            bowelTitle = @"Soft Blobs";
            break;
            
            case 5:
            bowelTitle = @"Mushy with ragged edges";
            break;
            
            case 6:
            bowelTitle = @"Watery";
            break;
            
        default:
            bowelTitle = @"Something else";
            break;
    }
    
    return bowelTitle;
}

+ (NSString *)defaultMessage {
    
    return @"How was it?";
}

+ (int)movementChoices {
    
    return 7;
}

@end
