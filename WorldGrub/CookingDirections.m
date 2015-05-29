//
//  CookingDirections.m
//  WorldGrub
//
//  Created by Rodrigo Carballo on 5/29/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "CookingDirections.h"

@implementation CookingDirections

+(NSString *)directionsFromJSON:(NSData *)jsonData {
    
    NSError *error;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    if (error) {
        NSLog(@"%@", error.localizedDescription);
        return nil;
    }
    NSString *directions = [jsonDictionary objectForKey:@"sourceUrl"];
    
    return directions;
    
}

@end
