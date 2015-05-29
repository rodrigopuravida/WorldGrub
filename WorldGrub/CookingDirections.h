//
//  CookingDirections.h
//  WorldGrub
//
//  Created by Rodrigo Carballo on 5/29/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CookingDirections : NSObject
+(NSString *) directionsFromJSON:(NSData *)jsonData;

@end
