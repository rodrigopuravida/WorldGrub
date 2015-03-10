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
//        NSDictionary *userInfo = item[@"owner"];
//        question.avatarURL = userInfo[@"profile_image"];
//        question.userId = userInfo[@"user_id"];
        
        [temp addObject:recipe];
    }
    NSArray *final = [[NSArray alloc] initWithArray:temp];
    return final;
}

@end