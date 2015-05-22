//
//  Ingredients.m
//  WorldGrub
//
//  Created by Rodrigo Carballo on 5/13/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "Ingredients.h"

@implementation Ingredients

+(NSArray *)ingredientsFromJSON:(NSData *)jsonData {
    
    NSError *error;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    if (error) {
        NSLog(@"%@", error.localizedDescription);
        return nil;
    }
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    Ingredients *ingredients = [[Ingredients alloc] init];
    
    ingredients.extendedIngredients = [jsonDictionary objectForKey:@"extendedIngredients"];
    [temp addObject:ingredients];
    
    NSArray *final = [[NSArray alloc] initWithArray:temp];
    return final;
    
    
}

@end
