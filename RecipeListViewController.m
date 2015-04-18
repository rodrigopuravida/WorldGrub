//
//  RecipeListViewController.m
//  
//
//  Created by Rodrigo Carballo on 3/9/15.
//
//

#import "RecipeListViewController.h"
#import "RecipeCell.h"
#import "Recipe.h"
#import "WorldGrubService.h"
#import "RecipeDetailViewController.h"

@interface RecipeListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) NSString *recipeId;
@property (weak, nonatomic) Recipe *recipe;

@end

@implementation RecipeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%lu", (unsigned long)self.recipeList.count);
    return self.recipeList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecipeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RECIPE_CELL"
                                                         forIndexPath:indexPath];
    self.recipe = self.recipeList[indexPath.row];
    cell.recipeTitle.text = self.recipe.title;
//    self.recipeId = self.recipe.recipeId;
//    NSLog(@"RecipeId");
//    NSLog(@"%@",self.recipeId);
    cell.recipeImage.image = nil;
    //lazy loading of image
    if (!self.recipe.recipeImage) {
        [[WorldGrubService sharedService] fetchUserImage:self.recipe.recipeURL completionHandler:^(UIImage *image) {
            self.recipe.recipeImage = image;
            cell.recipeImage.image = image;
        }];
    } else {
        cell.recipeImage.image = self.recipe.recipeImage;
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    RecipeDetailViewController *recipedetail = [self.storyboard instantiateViewControllerWithIdentifier:@"RECIPE_DETAIL_VC"];
    self.recipe = self.recipeList[indexPath.row];
    self.recipeId = self.recipe.recipeId;
    recipedetail.recipeDetailId = self.recipe.recipeId;
    recipedetail.imageUrl = self.recipe.recipeURL;

    
    NSLog(@"RecipeId");
    NSLog(@"%@",self.recipeId);
    [self.navigationController pushViewController:recipedetail animated:YES];


    
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"RECIPE_DETAIL_VC"]) {
//        RecipeDetailViewController *recipeDetailVC = (RecipeDetailViewController *)segue.destinationViewController;
//        //NSIndexPath *indexPath = self.tableView.indexPathsForSelectedRows.firstObject;
//        //recipeDetailVC.recipeDetailId = self.recipeList[indexPath.row];
//        recipeDetailVC.recipeDetailId = self.recipeId;
//        NSLog(@"SelectedID");
//        NSLog(@"%@",recipeDetailVC.recipeDetailId);
//
//        
//    }
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
 //RECIPEDETAILVC
 
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
