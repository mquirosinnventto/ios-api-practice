//
//  GitApiSessionTask.m
//  xcodeGitApiPractice
//
//  Created by mkdev on 15/03/16.
//  Copyright © 2016 Monitron. All rights reserved.
//

#import "GitApiSessionTask.h"
#import "../AFNetworking/AFNetworking.h"


@implementation GitApiSessionTask
NSString *GIT_URL = @"https://api.github.com";
+(void)sessionWithPath: (NSString *)path successHandler:(void(^)(NSURLSessionTask *task, id responseObject))responseHandler {
    NSURL *url = [NSURL URLWithString: GIT_URL];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL: url];
    
    [manager GET:path parameters:nil progress:nil success: responseHandler failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: Request couldnt be processed");
    }];
    
    [manager.operationQueue waitUntilAllOperationsAreFinished];
}
@end
