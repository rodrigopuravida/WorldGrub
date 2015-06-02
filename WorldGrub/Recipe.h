//
//  Recipe.h
//  WorldGrub
//
//  Created by Rodrigo Carballo on 3/9/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Recipe : NSObject

+(NSArray *)recipesFromJSON:(NSData *)jsonData;

@property (strong, nonatomic) NSString *title;
@property (strong,nonatomic) NSString *recipeId;
@property (strong, nonatomic) UIImage *recipeImage;
@property (strong, nonatomic) UIImage *recipeListImage;
@property (strong, nonatomic) NSString *recipeURL;
@property (strong, nonatomic) NSString *baseUri;
@property (strong, nonatomic) NSString *sourceUrl;



@end
