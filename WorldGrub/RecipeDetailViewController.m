//
//  RecipeDetailViewController.m
//  WorldGrub
//
//  Created by Rodrigo Carballo on 3/12/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "RecipeDetailViewController.h"
#import "WorldGrubService.h"
#import "SingleRecipe.h"
#import "IngredientsListViewController.h"
#import "CookingDirectionsViewController.h"


@interface RecipeDetailViewController ()

@property (strong,nonatomic) NSArray *recipeUrls;
@property (weak, nonatomic) SingleRecipe *currentRecipe;
@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIImageView *recipeImage;
@property (weak, nonatomic) IBOutlet UIButton *ingredientsBtn;
@property (weak, nonatomic) IBOutlet UIButton *directionsBtn;

@end

@implementation RecipeDetailViewController


- (IBAction)displayIngredients:(id)sender {
    IngredientsListViewController *ingredients = [self.storyboard instantiateViewControllerWithIdentifier:@"INGREDIENTS_VC"];
    ingredients.recipeDetailId = self.recipeDetailId;
    [self.navigationController pushViewController:ingredients animated:YES];
    NSLog(@"I am on  Ingredients");
}
- (IBAction)displayDirections:(id)sender {
    
    NSString *stringRecipeId = [NSString stringWithFormat:@"%d", self.recipeDetailId.intValue];
    //need to build this url - "https://webknox-recipes.p.mashape.com/recipes/156992/information"
    //156992 being the id for the recipe
    
    NSString *queryPart1 = @"https://webknox-recipes.p.mashape.com/recipes/";
    NSString *queryInConstruction1 = [queryPart1 stringByAppendingString:stringRecipeId];
    
    NSString *finalQuery = [queryInConstruction1 stringByAppendingString:@"/information"];
    
    [[WorldGrubService sharedService] fetchRecipeBasedOnId:finalQuery completionHandler:^(SingleRecipe *results, NSString *error) {
        
        self.currentRecipe = results;
        
        NSLog(@"WebSite URL");
        NSLog(@"%@", self.currentRecipe.sourceUrl);
        
        self.recipeUrlOriginal = self.currentRecipe.sourceUrl;
        //replacing ://
        self.recipeUrlOriginal = [self.recipeUrlOriginal stringByReplacingOccurrencesOfString:@"://"
                                                                                   withString:@"%3A%2F%2F"];
        
        //replacing /
        self.recipeUrlOriginal = [self.recipeUrlOriginal stringByReplacingOccurrencesOfString:@"/"
                                                                                   withString:@"%2F"];
        
        NSLog(@"Building query to get directions based on url");
        NSLog(@"%@", self.recipeUrlOriginal);
        
        NSString *baserUrl = @"https://webknox-recipes.p.mashape.com/recipes/extract?url=";
        NSString *queryForDirections = [baserUrl stringByAppendingString:self.recipeUrlOriginal];
        NSLog(@"%@", queryForDirections);
        
        
        
        CookingDirectionsViewController *directions = [self.storyboard instantiateViewControllerWithIdentifier:@"TEST"];
        directions.recipeDetailId = self.recipeDetailId;
        directions.recipeUrl = queryForDirections;
        [self.navigationController pushViewController:directions animated:YES];
        NSLog(@"I am on  Directions");
       }];
 
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSLog(@"RecipeId at Detail Recipe Controller");
    NSLog(@"%@",self.recipeDetailId);
    NSLog(@"%@",self.imageUrl);
    NSLog(@"%@",self.recipeUrl);
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.imageUrl]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        self.recipeImage.image = [UIImage imageWithData:data];
    }];
        
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
