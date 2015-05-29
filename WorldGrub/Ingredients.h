//
//  Ingredients.h
//  WorldGrub
//
//  Created by Rodrigo Carballo on 5/13/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ingredients : NSObject

+(NSArray *) ingredientsFromJSON:(NSData *)jsonData;

@property (strong, nonatomic) NSArray *extendedIngredients;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *amount;
@property (strong, nonatomic) NSString *unit;
@property (strong, nonatomic) NSString *unitShort;
@property (strong, nonatomic) NSString *unitLong;
@property (strong, nonatomic) NSString *originalString;
@property (strong, nonatomic) NSArray *metaInformation;

@end
