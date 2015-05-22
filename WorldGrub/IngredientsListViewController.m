//
//  IngredientsListViewController.m
//  WorldGrub
//
//  Created by Rodrigo Carballo on 5/21/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "IngredientsListViewController.h"
#import "WorldGrubService.h"

@implementation IngredientsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    
    NSLog(@"RecipeId at Detail Recipe Controller");
    NSLog(@"%@",self.recipeDetailId);
        
    NSString *stringRecipeId = [NSString stringWithFormat:@"%d", self.recipeDetailId.intValue];
    
    //need to build this url - "https://webknox-recipes.p.mashape.com/recipes/156992/information"
    //156992 being the id for the recipe
    
    NSString *queryPart1 = @"https://webknox-recipes.p.mashape.com/recipes/";
    NSString *queryInConstruction1 = [queryPart1 stringByAppendingString:stringRecipeId];
    
    NSString *finalQuery = [queryInConstruction1 stringByAppendingString:@"/information"];
    
    [[WorldGrubService sharedService] fetchIngredientsBasedOnId:finalQuery completionHandler:^(NSArray *results, NSString *error) {
        
        self.ingredients = results;
        
        
        
        NSLog(@"Pause");
        
    }];
    
}

@end
