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


@interface RecipeDetailViewController ()
@property (weak, nonatomic) NSString *recipeUrl;
@property (strong,nonatomic) NSArray *recipeUrls;
@property (weak, nonatomic) IBOutlet UIWebView *recipeWebView;
@property (weak, nonatomic) SingleRecipe *currentRecipe;
@property (strong, nonatomic) IBOutlet UIView *view;

@end

@implementation RecipeDetailViewController

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
    
    [[WorldGrubService sharedService] fetchRecipeBasedOnId:finalQuery completionHandler:^(NSArray *results, NSString *error) {
        self.recipeUrls = results;
        
        self.currentRecipe = results[0];
        
        //self.recipeWebView.frame = self.view.frame;
        [self.view addSubview:_recipeWebView];
        
        NSString *urlString = self.currentRecipe.recipeURL;
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        [self.recipeWebView loadRequest:urlRequest];
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