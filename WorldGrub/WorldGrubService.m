//
//  WorldGrubService.m
//  WorldGrub
//
//  Created by Rodrigo Carballo on 3/8/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "WorldGrubService.h"
#import <UNIRest.h>


@implementation WorldGrubService

+(id)sharedService {
    
    static WorldGrubService *mySharedService;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mySharedService = [[WorldGrubService alloc] init];
    });
    return mySharedService;
}

-(void)fetchRecipesWithSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSDictionary *results, NSString *error))completionHandler {
    
    
    NSDictionary *headers = @{@"X-Mashape-Key": @"A7ggDVHuZBmshbIcUqquqFDuWxZup1tLMDnjsnx8QpPISvJnPZ", @"Accept": @"application/json"};
    UNIUrlConnection *asyncConnection = [[UNIRest get:^(UNISimpleRequest *request) {
        [request setUrl:@"https://webknox-recipes.p.mashape.com/recipes/search?cuisine=italian&diet=vegetarian&excludeIngredients=coconut&intolerances=egg%2C+gluten&number=10&offset=0&query=burger&type=main+course"];
        [request setHeaders:headers];
    }] asJsonAsync:^(UNIHTTPJsonResponse *response, NSError *error) {
        NSInteger code = response.code;
        NSDictionary *responseHeaders = response.headers;
        UNIJsonNode *body = response.body;
        NSData *rawBody = response.rawBody;
        
        if (error) {
            completionHandler(nil,@"Could not connect");
        } else {
            
            switch (code) {
                case 200 ... 299: {
                    //                    NSLog(@"%ld",(long)statusCode);
                    //                    NSArray *results = [Question questionsFromJSON:data];
                    //
                    //                    dispatch_async(dispatch_get_main_queue(), ^{
                    //                        if (results) {
                    //                            completionHandler(results,nil);
                    //                        } else {
                    //                            completionHandler(nil,@"Search could not be completed");
                    //                        }
                    //                    });
                    //                    break;
                }
                default:
                    NSLog(@"%ld",(long)code);
                    break;
            }
            
        }
    }];
    
    NSString *urlString = @"https://webknox-recipes.p.mashape.com/recipes/search?cuisine=italian&diet=vegetarian&excludeIngredients=coconut&intolerances=egg%2C+gluten&number=10&offset=0&query=burger&type=main+course";
//    urlString = [urlString stringByAppendingString:@"search?order=desc&sort=activity&site=stackoverflow&intitle="];
//    urlString = [urlString stringByAppendingString:searchTerm];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *token = [defaults objectForKey:@"token"];
//    if (token) {
//        urlString = [urlString stringByAppendingString:@"&access_token="];
//        urlString = [urlString stringByAppendingString:token];
//        urlString = [urlString stringByAppendingString:@"&key=GhSjITmfOTlUpgQJWSnz2A(("];
//    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"GET";
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completionHandler(nil,@"Could not connect");
        } else {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            NSInteger statusCode = httpResponse.statusCode;
            
            switch (statusCode) {
                case 200 ... 299: {
//                    NSLog(@"%ld",(long)statusCode);
//                    NSArray *results = [Question questionsFromJSON:data];
//                    
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        if (results) {
//                            completionHandler(results,nil);
//                        } else {
//                            completionHandler(nil,@"Search could not be completed");
//                        }
//                    });
//                    break;
                }
                default:
                    NSLog(@"%ld",(long)statusCode);
                    break;
            }
            
        }
    }];
    [dataTask resume];
}


@end
