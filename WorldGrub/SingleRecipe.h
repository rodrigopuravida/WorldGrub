//
//  SingleRecipe.h
//  WorldGrub
//
//  Created by Rodrigo Carballo on 3/13/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleRecipe : NSObject

+(NSString *)recipeFromJSON:(NSData *)jsonData;

@property (strong, nonatomic) NSString *recipeURL;
@property (strong, nonatomic) NSString *sourceUrl;
@property (strong, nonatomic) NSString *foodImage;
@property (strong, nonatomic) NSString *recipeId;
@property (strong, nonatomic) NSString *recipeTitle;
@property (strong, nonatomic) NSMutableArray *extendedIngredients;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *amount;
@property (strong, nonatomic) NSString *unit;
@property (strong, nonatomic) NSString *unitShort;
@property (strong, nonatomic) NSString *unitLong;
@property (strong, nonatomic) NSString *originalString;
@property (strong, nonatomic) NSArray *metaInformation;




@end
