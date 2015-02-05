//
//  TGDataManager.h
//  TestGitHubAPI
//
//  Created by Боев Александр on 2/5/15.
//  Copyright (c) 2015 Боев Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGDataManager : NSObject

+ (TGDataManager *)sharedManager;
- (void)loadGitHubUsersWithSuccess:(void (^)(NSArray * users))aSuccess failure:(void (^)(NSError *error))aFailure;
@end
