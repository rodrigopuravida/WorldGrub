//
//  SingleRecipe.m
//  WorldGrub
//
//  Created by Rodrigo Carballo on 3/13/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "SingleRecipe.h"

@implementation SingleRecipe

+(NSArray *)recipeFromJSON:(NSData *)jsonData {
    
    NSError *error;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    if (error) {
        NSLog(@"%@", error.localizedDescription);
        return nil;
    }    
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        SingleRecipe *recipe = [[SingleRecipe alloc] init];
        recipe.recipeURL = [jsonDictionary objectForKey:@"imageUrls"];
        recipe.foodImage = [jsonDictionary objectForKey:@"image"];
        recipe.recipeId= [jsonDictionary objectForKey:@"id"];
        recipe.recipeTitle = [jsonDictionary objectForKey:@"title"];
        recipe.extendedIngredients = [jsonDictionary objectForKey:@"extendedIngredients"];
    
//    for (NSDictionary *item in recipe.extendedIngredients) {
//        recipe.name = item[@"name"];
//        
//        [temp addObject:recipe];
//    }
        [temp addObject:recipe];

    NSArray *final = [[NSArray alloc] initWithArray:temp];
    return final;
}
@end
