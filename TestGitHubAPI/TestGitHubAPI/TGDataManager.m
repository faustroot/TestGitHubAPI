//
//  TGDataManager.m
//  TestGitHubAPI
//
//  Created by Боев Александр on 2/5/15.
//  Copyright (c) 2015 Боев Александр. All rights reserved.
//

#import "TGDataManager.h"
#import "TGUser.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>

@interface TGDataManager ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation TGDataManager

+ (TGDataManager *)sharedManager
{
	static TGDataManager *_sharedManager = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedManager = [[self alloc] init];
	});
	
	return _sharedManager;
}

- (id)init
{
	if (self = [super init])
	{
		self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.github.com/"]];
		
		[SVProgressHUD setBackgroundColor:[UIColor darkGrayColor]];
		[SVProgressHUD setForegroundColor:[UIColor whiteColor]];
	}
	
	return self;
}

- (void)loadGitHubUsersWithSuccess:(void (^)(NSArray * users))aSuccess failure:(void (^)(NSError *error))aFailure
{
	[SVProgressHUD showInfoWithStatus:@"Loading"];
	
	[self.sessionManager GET:@"users"
				  parameters:nil
					 success:^(NSURLSessionDataTask *task, NSArray *responseObject)
	{
		NSMutableArray *users = [NSMutableArray array];
		for (NSDictionary *user in responseObject)
		{
			[users addObject:[[TGUser alloc] initWithDictionary:user]];
		}
		
		if (aSuccess)
		{
			aSuccess(users);
		}
		[SVProgressHUD dismiss];
	}
					 failure:^(NSURLSessionDataTask *task, NSError *error)
	{
		if (aFailure)
		{
			aFailure(error);
		}
		[SVProgressHUD dismiss];
	}];
}

@end
