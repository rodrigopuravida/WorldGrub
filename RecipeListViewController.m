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

@interface RecipeListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) NSString *recipeId;

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
    Recipe *recipe = self.recipeList[indexPath.row];
    cell.recipeTitle.text = recipe.title;
    
    //lazy loading of image
    if (!recipe.recipeImage) {
        [[WorldGrubService sharedService] fetchUserImage:recipe.recipeURL completionHandler:^(UIImage *image) {
            recipe.recipeImage = image;
            cell.recipeImage.image = image;
        }];
    } else {
        cell.recipeImage.image = recipe.recipeImage;
    }

    return cell;
}

- (void)did


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
