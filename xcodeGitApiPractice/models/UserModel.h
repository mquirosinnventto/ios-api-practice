//
//  UserModel.h
//  xcodeGitApiPractice
//
//  Created by mkdev on 14/03/16.
//  Copyright © 2016 Monitron. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
@property (strong, nonatomic) NSDictionary *data;
@property (strong, nonatomic) NSError *error;
-(NSString *)getAvatarURL;
-(void)fetchUserData;
@end
