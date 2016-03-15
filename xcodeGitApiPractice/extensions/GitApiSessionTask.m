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
NSString *BASE_URL = @"https://api.github.com";

+(void)sessionWithPath: (NSString *)path successHandler:( void ( ^ )(NSURLResponse *response, id responseObject, NSError *error) ) responseHandler {

    NSURL *url = [NSURL URLWithString: BASE_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL: url];
    [manager dataTaskWithRequest:request completionHandler: responseHandler];
    
    [manager.operationQueue waitUntilAllOperationsAreFinished];
}
@end
