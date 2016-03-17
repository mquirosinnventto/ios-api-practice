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

#import "../models/User.h"
#import "../views/HomeView.h"


@implementation HomeViewController

- (HomeViewController *)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        
//        self.user = [[User alloc] initWithJSON];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(viewIsReady) name:@"userDataRequestSucced" object:self.user];
    }
    return self;
}


- (void)searchUser{
    
}

- (void)loadView{
    self.view = [[HomeView alloc] initWithController:self];
}

- (void)viewIsReady{

}


-(void)showRepositoriesController{
    RepositoriesTableView *reposTableViewController = [[RepositoriesTableView alloc] init];
    reposTableViewController.view.backgroundColor = [UIColor blueBackground];
    [self.navigationController pushViewController: reposTableViewController animated:YES];
}


@end
