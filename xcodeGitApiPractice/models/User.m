//
//  User.m
//  xcodeGitApiPractice
//
//  Created by mkdev on 16/03/16.
//  Copyright © 2016 Monitron. All rights reserved.
//

#import "User.h"
#import "../extensions/GitApiSessionTask.h"
#import "../AFNetworking/AFNetworking.h"

@implementation User

-(User *)  initWithUsername: (NSString*) username
                      aType: (NSString*) type
                   aCompany: (NSString*) company
                  aLocation: (NSString*) location{
    
    self = [[User alloc] init];
    _username = username;
    _type = type;
    _company = company;
    _location = location;
    return self;
}

-(User *)initWithJSON{
    self = [self initWithUsername:@"" aType:@"" aCompany:@"" aLocation:@""];
    void (^successHandler)(NSURLSessionTask *task, id responseObject) = [self getRequestSuccessHandler];
    void (^errorHandler)(NSURLSessionTask *operation, NSError *error) = [self getRequestErrorhandler];
    [self requestUserWithSuccessHandler: successHandler anErrorHandler: errorHandler];
    return self;
}

- (void)requestUserWithSuccessHandler: (void(^)(NSURLSessionTask *task, id responseObject))successHandler
                       anErrorHandler: (void (^)(NSURLSessionTask *operation, NSError *error))errorHandler{    
    NSURL *url = [NSURL URLWithString: @"https://api.github.com"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL: url];
    
    [manager GET: @"/users/mquirosinnventto"  parameters:nil progress:nil success: successHandler failure: errorHandler];
    [manager.operationQueue waitUntilAllOperationsAreFinished];
}

- (void)setUserData:(NSDictionary *)JSON{
    _username = JSON[@"login"];
    _type = JSON[@"type"];
    _company = JSON[@"company"];
    _location = JSON[@"location"];
}

- (void (^)(NSURLSessionTask *task, id responseObject))getRequestSuccessHandler{
    void (^handler)(NSURLSessionTask *task, id responseObject) = ^void(NSURLSessionTask *task, id responseObject){
        NSLog(@"Success on request....");
        [self setUserData:responseObject];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"userDataRequestSucced" object:self];
    };
    return handler;
}

- (void(^)(NSURLSessionTask *operation, NSError *error))getRequestErrorhandler{
    void(^handler)(NSURLSessionTask *operation, NSError *error) = ^void(NSURLSessionTask *operation, NSError *error){
        NSLog(@"Error on request...");
        NSLog(@"%@", [error description]);
    };
    return handler;
}


@end
