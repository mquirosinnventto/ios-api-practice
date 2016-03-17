//
//  User.h
//  xcodeGitApiPractice
//
//  Created by mkdev on 16/03/16.
//  Copyright © 2016 Monitron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (strong, nonatomic, readonly) NSString *username;
@property (strong, nonatomic, readonly) NSString *type;
@property (strong, nonatomic, readonly) NSURL *avatarUrl;
@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSString *company;
@property (strong, nonatomic, readonly) NSString *location;

@property (readonly) int totalRepos;

-(User *)initWithJSON;
@end
