//
//  HomeViewController.m
//  xcodeGitApiPractice
//
//  Created by mkdev on 14/03/16.
//  Copyright © 2016 Monitron. All rights reserved.
//

#import "HomeViewController.h"
#import "RepositoriesTableView.h"
#import "../extensions/UIColor+AppColors.h"
#import "../extensions/UIScreen+AppScreen.h"
#import "../extensions/GitApiSessionTask.h"


@implementation HomeViewController
float const profileImageSize = 180.0;
float const screenMargin = 20.0;

- (HomeViewController *)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.view.backgroundColor = [UIColor blueBackground];
        [self viewComponentSetup];
//        [self setViewComponents];
        [self testDataFetch];
        
    }
    return self;
}

- (void)testDataFetch{
    void (^handler)(NSURLSessionTask *task, id responseObject) = ^void(NSURLSessionTask *task, id responseObject){
        self.userData = (NSDictionary*)responseObject;
        [self setViewComponents];
    };
    [GitApiSessionTask sessionWithPath:@"/users/codeschool" successHandler:handler];
}

- (void)setViewComponents{
    NSData *profileImageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: self.userData[@"avatar_url"]]];
    UIImage *profileImage = [[UIImage alloc] initWithData:profileImageData];
    self.profileImageView.image = profileImage;
    self.nameLabelView.text = [@"User Name: " stringByAppendingString: self.userData[@"login"]];
    self.typelabelView.text = [@"User type: " stringByAppendingString: self.userData[@"type"]];
    self.reposlabelView.text = [NSString stringWithFormat: @"User Repos: %d",(int)self.userData[@"public_repos"]];
    UIButton *repoButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    float labelWide = [UIScreen screenWidth] - (screenMargin * 2.0);
    repoButton.frame = CGRectMake(screenMargin, 460, labelWide, 40);
    [repoButton setTitle:@"Repositories" forState:UIControlStateNormal];
    repoButton.backgroundColor = [UIColor whiteColor];
    [repoButton addTarget:self action: @selector(showRepositoriesController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:repoButton];
}

-(void)showRepositoriesController{
    RepositoriesTableView *reposTableViewController = [[RepositoriesTableView alloc] init];
    reposTableViewController.view.backgroundColor = [UIColor blueBackground];
    [self.navigationController pushViewController: reposTableViewController animated:YES];
}


- (void)viewComponentSetup{
    self.profileImageView = [[UIImageView alloc] init];
    self.profileImageView.layer.cornerRadius = profileImageSize/2.0;
    self.profileImageView.layer.masksToBounds = YES;
    float xPos = [UIScreen getViewComponentPositionX:screenMargin withWidth:profileImageSize];
    self.profileImageView.frame = CGRectMake(xPos, 100, profileImageSize, profileImageSize);
    
    float labelWide = [UIScreen screenWidth] - (screenMargin * 2.0);
    self.nameLabelView = [[UILabel alloc] initWithFrame: CGRectMake(screenMargin, 300, labelWide, 40)];
    self.nameLabelView.textAlignment = NSTextAlignmentCenter;
    self.nameLabelView.textColor = [UIColor whiteColor];
    
    self.reposlabelView = [[UILabel alloc] initWithFrame: CGRectMake(screenMargin, 360, labelWide, 40)];
    self.reposlabelView.textColor = [UIColor whiteColor];
    self.reposlabelView.textAlignment = NSTextAlignmentCenter;
    
    self.typelabelView = [[UILabel alloc] initWithFrame: CGRectMake(screenMargin, 410, labelWide, 40)];
    self.typelabelView.textColor = [UIColor whiteColor];
    self.typelabelView.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.profileImageView ];
    [self.view addSubview:self.nameLabelView];
    [self.view addSubview:self.reposlabelView];
    [self.view addSubview:self.typelabelView];
}



@end
