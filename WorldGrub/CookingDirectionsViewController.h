//
//  CookingDirectionsViewController.h
//  WorldGrub
//
//  Created by Rodrigo Carballo on 6/2/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CookingDirectionsViewController : UIViewController
@property (weak, nonatomic) NSString *recipeDetailId;
@property (weak, nonatomic) NSString *recipeUrlOriginal;
@property (weak, nonatomic) NSString *recipeUrl;

@end
