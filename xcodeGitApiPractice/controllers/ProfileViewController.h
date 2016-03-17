//
//  ProfileViewController.h
//  xcodeGitApiPractice
//
//  Created by mkdev on 17/03/16.
//  Copyright © 2016 Monitron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../models/User.h"

@interface ProfileViewController : UIViewController
@property (strong, nonatomic) User *user;
@end
