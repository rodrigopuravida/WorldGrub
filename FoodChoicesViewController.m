//
//  FoodChoicesViewController.m
//  WorldGrub
//
//  Created by Rodrigo Carballo on 3/7/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "FoodChoicesViewController.h"
#import "WorldGrubService.h"
#import "Recipe.h"
#import "RecipeListViewController.h"

@interface FoodChoicesViewController () <UIPickerViewDataSource, UIPickerViewDelegate, UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UIView *tableView;
@property (strong,nonatomic) NSArray *recipes;
@property (strong,nonatomic) NSArray *countryArray;
@property (strong, nonatomic) NSString *cuisine;
@property (strong, nonatomic) NSString *foodQuery;
@property (strong, nonatomic) NSString *queryPart1;

@property (weak, nonatomic) IBOutlet UITextField *userInputQueryText;

@property (weak, nonatomic) IBOutlet UIPickerView *countryPickerView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end

@implementation FoodChoicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.countryPickerView.dataSource = self;
    self.countryPickerView.delegate = self;
    self.searchBar.delegate = self;
    // Do any additional setup after loading the view.
    
    //TODO: Set up background for image
//    UIGraphicsBeginImageContext(self.view.frame.size);
//    [[UIImage imageNamed:@"mexicanfood.jpg"] drawInRect:self.view.bounds];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:image];

    //setting up values for UIPicker
    self.countryArray = @[@"African", @"Chinese", @"Japanese", @"Korean", @"Vietnamese", @"Thai", @"Indian", @"British", @"Irish", @"French", @"Italian", @"Mexican", @"Spanish", @"Middle Eastern", @"Jewish", @"American", @"Cajun", @"Southern", @"Greek", @"German", @"Nordic", @"Eastern European", @"Caribbean", @"Latin American"];
 
    //sample URL
    //https://webknox-recipes.p.mashape.com/recipes/search?cuisine=italian&number=30&offset=0&query=pasta
    
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    //NSLog(self.cuisine);
    
    self.queryPart1 = @"https://webknox-recipes.p.mashape.com/recipes/search?cuisine=";
    NSString *queryInConstruction1 = [self.queryPart1 stringByAppendingString:self.cuisine];
    NSString *queryInConstruction2 = [queryInConstruction1 stringByAppendingString:@"&number=100&offset=0&query="];
    
    //now need to check for spaces in the query for food
    
    NSString *testString = self.searchBar.text;
    NSString *trimmedString = [testString stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    //need to replace white space with '+'
    NSString *nonWhiteSpaceString = [trimmedString stringByReplacingOccurrencesOfString:@"[ ]" withString:@"+" options: NSRegularExpressionSearch range:NSMakeRange(0, trimmedString.length)];
    
    
    NSString *finalQuery = [queryInConstruction2 stringByAppendingString:nonWhiteSpaceString];
    
    [[WorldGrubService sharedService] fetchRecipesWithSearchTerm:finalQuery completionHandler:^(NSArray *results, NSString *error) {
        self.recipes = results;
        
        
        RecipeListViewController *recipeList = [self.storyboard instantiateViewControllerWithIdentifier:@"RECIPELISTVC"];
        recipeList.recipeList = self.recipes;
        [self.navigationController pushViewController:recipeList animated:YES];
        
    }];
        
}


- (void)pickerView:(UIPickerView *)countryPickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    //self.cuisine = self.countryArray[row];
    NSString *toModifyCountryString = self.countryArray[row];
    //setting to lower case
    NSString *toLowerCaseString = [toModifyCountryString lowercaseString];
    
    self.cuisine = [toLowerCaseString stringByReplacingOccurrencesOfString:@"[ ]" withString:@"+" options: NSRegularExpressionSearch range:NSMakeRange(0, toLowerCaseString.length)];}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)countryPickerView numberOfRowsInComponent:(NSInteger)component {
    return self.countryArray.count;
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)countryPickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    //self.cuisine = self.countryArray[row];
    self.cuisine = self.countryArray[row];

    return self.cuisine;
}

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)countryPickerView widthForComponent:(NSInteger)component {
    int sectionWidth = 300;
    
    return sectionWidth;
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
