//
//  FoodChoicesViewController.m
//  WorldGrub
//
//  Created by Rodrigo Carballo on 3/7/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "FoodChoicesViewController.h"

@interface FoodChoicesViewController ()

@property (strong, nonatomic) IBOutlet UIView *tableView;

@end

@implementation FoodChoicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIGraphicsBeginImageContext(self.view.frame.size);
//    [[UIImage imageNamed:@"mexicanfood.jpg"] drawInRect:self.view.bounds];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)foodChoicesButtonPressed:(id)sender {
    
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
