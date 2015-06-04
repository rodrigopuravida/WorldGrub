//
//  RecipeDetailViewController.h
//  WorldGrub
//
//  Created by Rodrigo Carballo on 3/12/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController

@property (weak, nonatomic) NSString *recipeDetailId;
@property (weak, nonatomic) NSString *imageUrl;
@property (weak, nonatomic) NSString *recipeUrl;
@property (weak, nonatomic) NSString *sourceUrl;
@property (strong, nonatomic) UIImage *foodImage;
@property (strong, nonatomic) NSMutableArray *recipeIngredients;
@property (weak, nonatomic) NSString *recipeUrlOriginal;

@end
