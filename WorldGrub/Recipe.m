//
//  Recipe.m
//  WorldGrub
//
//  Created by Rodrigo Carballo on 3/9/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe

+(NSArray *)recipesFromJSON:(NSData *)jsonData {
    
    NSError *error;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    if (error) {
        NSLog(@"%@", error.localizedDescription);
        return nil;
    }
    NSArray *items = [jsonDictionary objectForKey:@"results"];
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in items) {
        Recipe *recipe = [[Recipe alloc] init];
        recipe.title = item[@"title"];
        recipe.recipeId = item[@"id"];
        NSLog(@"%@", recipe.recipeId);
        
        
        //recipe.recipeListImage = item[@"image"];
        recipe.sourceUrl = item[@"sourceUrl"];
        recipe.baseUri = [jsonDictionary objectForKey:@"baseUri"];
        //NSArray *recipeUrls = item[@"imageUrls"];
        
        //There are cases where the image is null so need to add an empty value to string
        if (item[@"image"] == nil) {
            recipe.recipeURL = @"";
        }
        else {
            recipe.recipeURL = item[@"image"];   
        }
        
        //concatenating both strings
        //recipe.recipeURL = [recipe.baseUri stringByAppendingString:recipeUrls[0]];
        recipe.recipeURL = [recipe.baseUri stringByAppendingString:recipe.recipeURL];

        [temp addObject:recipe];
    }
    NSArray *final = [[NSArray alloc] initWithArray:temp];
    return final;
}

@end
