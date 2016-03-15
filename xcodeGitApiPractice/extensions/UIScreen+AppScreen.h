//
//  UIScreen+AppScreen.h
//  xcodeGitApiPractice
//
//  Created by mkdev on 15/03/16.
//  Copyright © 2016 Monitron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (AppScreen)
+(float)screenWidth;
+(float)screenHeight;
+(float)getViewComponentPositionX:(float)posX withWidth:(float)width;
@end
