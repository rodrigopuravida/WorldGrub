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
    NSArray *items = [jsonDictionary objectForKey:@"extendedIngredients"];
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    
        for (NSDictionary *item in items) {
        Ingredients *ingredient = [[Ingredients alloc] init];
        ingredient.name = item[@"name"];
        ingredient.originalString = item[@"originalString"];
        
        [temp addObject:ingredient];
        
    }
    
    NSArray *final = [[NSArray alloc] initWithArray:temp];
    return final;
        
}

@end
