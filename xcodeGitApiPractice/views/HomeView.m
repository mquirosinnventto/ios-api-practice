//
//  HomeView.m
//  xcodeGitApiPractice
//
//  Created by mkdev on 16/03/16.
//  Copyright © 2016 Monitron. All rights reserved.
//

#import "HomeView.h"
#import "../extensions/UIColor+AppColors.h"
#import "../models/User.h"

@implementation HomeView

float const profileImageSize = 180.0;
float const screenMargin = 20.0;

-(HomeView *)initWithController: (HomeViewController *)controller{
    self = [super init];
    _controller = controller;
    self.backgroundColor = [UIColor blueBackground];
    [self setupComponents];
    return self;
}

- (void)setupComponents{
    self.userLabel = [[UILabel alloc] initWithFrame: CGRectMake(100, 100, 200, 40)];
    self.userLabel.textColor = [UIColor whiteColor];
    self.userLabel.textAlignment = UIControlContentHorizontalAlignmentCenter;
    self.userLabel.text = @"Ingrese el usuario git";
    
    self.userInput = [[ UITextField alloc] initWithFrame: CGRectMake(100, 150, 200, 40)];
    self.userInput.borderStyle = UITextBorderStyleRoundedRect;
    self.userInput.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.userInput.placeholder = @"Usuario Git";
    [self.userInput setFont:[UIFont boldSystemFontOfSize:12]];
    
    self.submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.submitButton.frame = CGRectMake(100, 200, 200, 40);
    [self.submitButton setTitle: @"Buscar" forState: UIControlStateNormal];
    
    [self.submitButton addTarget: self.controller action:@selector(searchUser) forControlEvents: UIControlEventTouchUpInside];
    
    [self addSubview: self.userLabel];
    [self addSubview: self.userInput];
    [self addSubview: self.submitButton];
}


//- (void)setViewComponents{
//    NSData *profileImageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: self.userData[@"avatar_url"]]];
//    UIImage *profileImage = [[UIImage alloc] initWithData:profileImageData];
//    self.profileImageView.image = profileImage;
//    self.nameLabelView.text = [@"User Name: " stringByAppendingString: self.userData[@"login"]];
//    self.typelabelView.text = [@"User type: " stringByAppendingString: self.userData[@"type"]];
//    self.reposlabelView.text = [NSString stringWithFormat: @"User Repos: %d",(int)self.userData[@"public_repos"]];
//    UIButton *repoButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
//    float labelWide = [UIScreen screenWidth] - (screenMargin * 2.0);
//    repoButton.frame = CGRectMake(screenMargin, 460, labelWide, 40);
//    [repoButton setTitle:@"Repositories" forState:UIControlStateNormal];
//    repoButton.backgroundColor = [UIColor whiteColor];
//    [repoButton addTarget:self action: @selector(showRepositoriesController) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:repoButton];
//}

//- (void)viewComponentSetup{
//    self.profileImageView = [[UIImageView alloc] init];
//    self.profileImageView.layer.cornerRadius = profileImageSize/2.0;
//    self.profileImageView.layer.masksToBounds = YES;
//    float xPos = [UIScreen getViewComponentPositionX:screenMargin withWidth:profileImageSize];
//    self.profileImageView.frame = CGRectMake(xPos, 100, profileImageSize, profileImageSize);
//    
//    float labelWide = [UIScreen screenWidth] - (screenMargin * 2.0);
//    self.nameLabelView = [[UILabel alloc] initWithFrame: CGRectMake(screenMargin, 300, labelWide, 40)];
//    self.nameLabelView.textAlignment = NSTextAlignmentCenter;
//    self.nameLabelView.textColor = [UIColor whiteColor];
//    
//    self.reposlabelView = [[UILabel alloc] initWithFrame: CGRectMake(screenMargin, 360, labelWide, 40)];
//    self.reposlabelView.textColor = [UIColor whiteColor];
//    self.reposlabelView.textAlignment = NSTextAlignmentCenter;
//    
//    self.typelabelView = [[UILabel alloc] initWithFrame: CGRectMake(screenMargin, 410, labelWide, 40)];
//    self.typelabelView.textColor = [UIColor whiteColor];
//    self.typelabelView.textAlignment = NSTextAlignmentCenter;
//    
//    [self.view addSubview:self.profileImageView ];
//    [self.view addSubview:self.nameLabelView];
//    [self.view addSubview:self.reposlabelView];
//    [self.view addSubview:self.typelabelView];
//}
@end
