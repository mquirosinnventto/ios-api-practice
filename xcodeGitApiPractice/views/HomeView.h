//
//  HomeView.h
//  xcodeGitApiPractice
//
//  Created by mkdev on 16/03/16.
//  Copyright © 2016 Monitron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../controllers/HomeViewController.h"
#import "../models/User.h"

@interface HomeView : UIView
@property (strong, nonatomic, readonly) HomeViewController *controller;
@property (strong, nonatomic) UITextField *userInput;
@property (strong, nonatomic) UIButton *submitButton;
@property (strong, nonatomic) UILabel *userLabel;
- (void)setupComponents;
-(HomeView *)initWithController: (HomeViewController *)controller;
@end
