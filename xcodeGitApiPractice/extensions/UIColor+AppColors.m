//
//  UIColor+AppColors.m
//  xcodeGitApiPractice
//
//  Created by mkdev on 15/03/16.
//  Copyright © 2016 Monitron. All rights reserved.
//

#import "UIColor+AppColors.h"

@implementation UIColor (AppColors)
+(UIColor *)getRbgWithRed:(float)red green:(float)green blue:(float)blue alpha: (float)alpha {
    float redPercentage = red/255.0;
    float greenPercentage = green/255.0;
    float bluePercentage = blue/255.0;
    return [UIColor colorWithRed:redPercentage green:greenPercentage blue:bluePercentage alpha:alpha];
}

+(UIColor *)blueBackground{
    return [self getRbgWithRed:62.0 green:59.0 blue:74.0 alpha:1.0];
}
@end
