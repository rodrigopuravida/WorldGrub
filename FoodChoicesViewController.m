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

@interface FoodChoicesViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *tableView;
@property (strong,nonatomic) NSArray *recipes;
@property (strong,nonatomic) NSArray *countryArray;

@property (weak, nonatomic) IBOutlet UIPickerView *countryPickerView;


@end

@implementation FoodChoicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.countryPickerView.dataSource = self;
    self.countryPickerView.delegate = self;
    // Do any additional setup after loading the view.
    
    //TODO: Set up background for image
//    UIGraphicsBeginImageContext(self.view.frame.size);
//    [[UIImage imageNamed:@"mexicanfood.jpg"] drawInRect:self.view.bounds];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:image];

    //setting up values for UIPicker
    self.countryArray = @[@"Row 1", @"Row 2", @"Row 3",];
 
}

- (void)pickerView:(UIPickerView *)countryPickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
}

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
    NSString *title;
    
    title = self.countryArray[row];
    
    return title;
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

- (IBAction)foodChoicesButtonPressed:(id)sender {
    
    [[WorldGrubService sharedService] fetchRecipesWithSearchTerm:@"" completionHandler:^(NSArray *results, NSString *error) {
    self.recipes = results;
        
        
    RecipeListViewController *recipeList = [self.storyboard instantiateViewControllerWithIdentifier:@"RECIPELISTVC"];
    recipeList.recipeList = self.recipes;
    [self.navigationController pushViewController:recipeList animated:YES];
        

    }];
    
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
