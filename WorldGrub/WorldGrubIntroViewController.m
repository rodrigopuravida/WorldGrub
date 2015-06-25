//
//  WorldGrubIntroViewController.m
//  WorldGrub
//
//  Created by Rodrigo Carballo on 6/9/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "WorldGrubIntroViewController.h"
#import "FoodChoicesViewController.h"

@interface WorldGrubIntroViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *worldGrubImage;
@property (weak, nonatomic) IBOutlet UILabel *foodQuoteLabel;

@end

@implementation WorldGrubIntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.foodQuoteLabel.font = [UIFont fontWithName:@"ChalkboardSE-Regular" size:20];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
    singleTap.numberOfTapsRequired = 1;
    [self.worldGrubImage setUserInteractionEnabled:YES];
    [self.worldGrubImage addGestureRecognizer:singleTap];
    
    UISwipeGestureRecognizer *singleSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDetected)];
    [singleSwipe setDirection:(UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft )];
    [self.worldGrubImage addGestureRecognizer:singleSwipe];

    
}

-(void)tapDetected{
    NSLog(@"single Tap on WorldGrub Image");
    FoodChoicesViewController *foodChoices = [self.storyboard instantiateViewControllerWithIdentifier:@"FOODCHOICESVC"];
    [self.navigationController pushViewController:foodChoices animated:YES];
    
}

-(void)swipeDetected{
    NSLog(@"single Tap on WorldGrub Image");
    FoodChoicesViewController *foodChoices = [self.storyboard instantiateViewControllerWithIdentifier:@"FOODCHOICESVC"];
    [self.navigationController pushViewController:foodChoices animated:YES];
    
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
