//
//  CookingDirectionsViewController.h
//  WorldGrub
//
//  Created by Rodrigo Carballo on 6/2/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CookingDirectionsViewController : UIViewController
@property (strong, nonatomic) NSString *recipeDetailId;
@property (strong, nonatomic) NSString *recipeUrl;
@property (strong, nonatomic) NSString *queryForDirections;

@end
