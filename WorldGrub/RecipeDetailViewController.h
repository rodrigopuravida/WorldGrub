//
//  RecipeDetailViewController.h
//  WorldGrub
//
//  Created by Rodrigo Carballo on 3/12/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController

@property (strong, nonatomic) NSString *recipeDetailId;
@property (strong, nonatomic) NSString *queryForDirections;
@property (strong, nonatomic) NSString *imageUrl;
@property (strong, nonatomic) NSString *recipeUrl;
@property (strong, nonatomic) NSString *sourceUrl;
@property (strong, nonatomic) UIImage *foodImage;
@property (strong, nonatomic) NSMutableArray *recipeIngredients;
@property (strong, nonatomic) NSString *recipeUrlOriginal;

@end
