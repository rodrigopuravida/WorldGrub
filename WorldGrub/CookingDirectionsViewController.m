//
//  CookingDirectionsViewController.m
//  WorldGrub
//
//  Created by Rodrigo Carballo on 6/2/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "CookingDirectionsViewController.h"
#import "WorldGrubService.h"
#import "SingleRecipe.h"

@interface CookingDirectionsViewController ()

@property (strong,nonatomic) SingleRecipe *myRecipe;
@property (weak, nonatomic) IBOutlet UILabel *directions;

@end

@implementation CookingDirectionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSLog(@"RecipeId at Directions Controller");
//    NSLog(@"%@",self.recipeDetailId);
//    
//        NSString *stringRecipeId = [NSString stringWithFormat:@"%d", self.recipeDetailId.intValue];
//    
//        //need to build this url - "https://webknox-recipes.p.mashape.com/recipes/156992/information"
//        //156992 being the id for the recipe
//    
//        NSString *queryPart1 = @"https://webknox-recipes.p.mashape.com/recipes/";
//        NSString *queryInConstruction1 = [queryPart1 stringByAppendingString:stringRecipeId];
//    
//        NSString *finalQuery = [queryInConstruction1 stringByAppendingString:@"/information"];
//    
//        [[WorldGrubService sharedService] fetchRecipeBasedOnId:finalQuery completionHandler:^(SingleRecipe *results, NSString *error) {
//    
//           self.myRecipe = results;
// 
//            NSLog(@"WebSite URL");
//            NSLog(@"%@", self.myRecipe.sourceUrl);
//            
//            self.recipeUrlOriginal = self.myRecipe.sourceUrl;
//            //replacing ://
//            self.recipeUrlOriginal = [self.recipeUrlOriginal stringByReplacingOccurrencesOfString:@"://"
//                                                                                       withString:@"%3A%2F%2F"];
//            
//            //replacing /
//            self.recipeUrlOriginal = [self.recipeUrlOriginal stringByReplacingOccurrencesOfString:@"/"
//                                                                                       withString:@"%2F"];
//            
//            NSLog(@"Building query to get directions based on url");
//            NSLog(@"%@", self.recipeUrlOriginal);
//            
//            NSString *baserUrl = @"https://webknox-recipes.p.mashape.com/recipes/extract?url=";
//            NSString *queryForDirections = [baserUrl stringByAppendingString:self.recipeUrlOriginal];
//            NSLog(@"%@", queryForDirections);
    
            NSString *queryForDirections = self.recipeUrl;
    
            [[WorldGrubService sharedService] fetchDirectionsBasedOnUrl:queryForDirections completionHandler:^(NSString *results, NSString *error) {
                
                NSString *cookingDirections = results;
                NSLog(@"%@", cookingDirections);
                
                if (cookingDirections == (id)[NSNull null] || cookingDirections.length == 0 ) {
                    self.directions.text = (@"No directions found - Apologies");
                    
                }
                else {
                    self.directions.text = cookingDirections;
                    [self.directions sizeToFit];
                    self.directions.numberOfLines = 0;
                    [self.directions sizeToFit];
                }
                
                }];
         
       // }];
    
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
