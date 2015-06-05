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

@property (weak, nonatomic) IBOutlet UITextView *directions;

@end

@implementation CookingDirectionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
            [[WorldGrubService sharedService] fetchDirectionsBasedOnUrl:self.recipeUrl completionHandler:^(NSString *results, NSString *error) {
                
                NSString *cookingDirections = results;
                NSLog(@"%@", cookingDirections);
                
                if (cookingDirections == (id)[NSNull null] || cookingDirections.length == 0 ) {
                    
                    self.recipeUrl = [self.recipeUrl stringByReplacingOccurrencesOfString:@"forceExtraction=false"
                                                                                               withString:@"forceExtraction=true"];
                    
                    [[WorldGrubService sharedService] fetchDirectionsBasedOnUrl:self.recipeUrl completionHandler:^(NSString *results, NSString *error) {
                        
                        NSString *cookingDirections = results;
                        self.directions.text = cookingDirections;
                        
                        }];

                    //self.directions.text = (@"No directions found - Apologies");
                    
                }
                else {
                    self.directions.text = cookingDirections;
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
