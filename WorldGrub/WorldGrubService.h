//
//  WorldGrubService.h
//  WorldGrub
//
//  Created by Rodrigo Carballo on 3/8/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WorldGrubService : NSObject

+(id)sharedService;

-(void)fetchRecipesWithSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray *results, NSString *error))completionHandler;


@end
