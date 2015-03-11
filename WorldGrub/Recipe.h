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
@property (strong,nonatomic) NSString *userId;
@property (strong, nonatomic) UIImage *recipeImage;


@end
