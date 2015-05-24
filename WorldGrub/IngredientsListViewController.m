//
//  IngredientsListViewController.m
//  WorldGrub
//
//  Created by Rodrigo Carballo on 5/21/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "IngredientsListViewController.h"
#import "WorldGrubService.h"
#import "Ingredients.h"
#import "IngredientsCell.h"


@interface IngredientsListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong,nonatomic) NSArray *ingredients;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation IngredientsListViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
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
        NSLog(@"Stop");
        
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ingredients.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IngredientsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"INGREDIENTS_CELL"
                                                         forIndexPath:indexPath];
    Ingredients *ingredient = self.ingredients[indexPath.row];
    //cell.nameLbl.text = ingredient.name;
    cell.nameLbl.text = @"Stop";
    return cell;
}

@end
