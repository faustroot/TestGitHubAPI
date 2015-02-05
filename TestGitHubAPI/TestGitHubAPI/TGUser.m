//
//  TGUser.m
//  TestGitHubAPI
//
//  Created by Боев Александр on 2/4/15.
//  Copyright (c) 2015 Боев Александр. All rights reserved.
//

#import "TGUser.h"

@implementation TGUser

- (id)initWithDictionary:(NSDictionary *)aDictionary
{
	if (self = [super init])
	{
		self.login = [aDictionary objectForKey:@"login"];
		self.url_avatar = [aDictionary objectForKey:@"avatar_url"];
		self.url_html = [aDictionary objectForKey:@"html_url"];
		/*
			Other parametrs can be add when needed
		 */
	}
	return self;
}

- (NSURL*)urlAvatarForSize:(NSInteger)aSize
{
	return [NSURL URLWithString:[NSString stringWithFormat:@"%@&size=%ld", self.url_avatar, (long)aSize]];
}
@end
