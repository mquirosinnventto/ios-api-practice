//
//  UIScreen+AppScreen.m
//  xcodeGitApiPractice
//
//  Created by mkdev on 15/03/16.
//  Copyright © 2016 Monitron. All rights reserved.
//

#import "UIScreen+AppScreen.h"

@implementation UIScreen (AppScreen)
+(float)screenWidth{
    CGRect mainScreenBounds = [[self mainScreen] bounds];
    return mainScreenBounds.size.width;
}

+(float)screenHeight{
    CGRect mainScreenBounds = [[self mainScreen] bounds];
    return mainScreenBounds.size.height;
}

+(float)getViewComponentPositionX:(float)posX withWidth:(float)width{
    float screendWith = [self screenWidth];
    float centerPosition = (screendWith/2.0) - (width/2.0);
    return centerPosition;
}

@end
