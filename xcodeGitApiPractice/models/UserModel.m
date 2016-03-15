//
//  UserModel.m
//  xcodeGitApiPractice
//
//  Created by mkdev on 14/03/16.
//  Copyright © 2016 Monitron. All rights reserved.
//

#import "UserModel.h"
#import "../AFNetworking/AFNetworking.h"

NSString *BASE_URL = @"https://api.github.com";

@implementation UserModel


- (void)fetchUserData{
    NSURL *url = [NSURL URLWithString: BASE_URL];
    self.data = [[NSDictionary alloc] init];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL: url];

    __block int status = 0;

    [manager GET:@"users/codeschool" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        self.data = (NSDictionary *)responseObject;
        status = 1;
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        _error = error;
        status = 2;
    }];
    
    [manager.operationQueue waitUntilAllOperationsAreFinished];

  
    while (status == 0)
    {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode                            beforeDate:[NSDate date]];
    }

}

-(NSString *)getAvatarURL{
    NSString *imageURL = self.data[@"avatar_url"];
    return imageURL;
}



@end 
