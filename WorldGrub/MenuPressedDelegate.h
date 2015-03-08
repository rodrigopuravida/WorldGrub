//
//  MenuPressedDelegate.h
//  WorldGrub
//
//  Created by Rodrigo Carballo on 3/7/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MenuPressedDelegate <NSObject>

-(void)menuOptionSelected:(NSInteger)selectedRow;

@end
