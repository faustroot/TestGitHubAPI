//
//  TGUser.h
//  TestGitHubAPI
//
//  Created by Боев Александр on 2/4/15.
//  Copyright (c) 2015 Боев Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGUser : NSObject
//{
//	"login": "mojombo",
//	"id": 1,
//	"avatar_url": "https://avatars.githubusercontent.com/u/1?v=3",
//	"gravatar_id": "",
//	"url": "https://api.github.com/users/mojombo",
//	"html_url": "https://github.com/mojombo",
//	"followers_url": "https://api.github.com/users/mojombo/followers",
//	"following_url": "https://api.github.com/users/mojombo/following{/other_user}",
//	"gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
//	"starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
//	"subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
//	"organizations_url": "https://api.github.com/users/mojombo/orgs",
//	"repos_url": "https://api.github.com/users/mojombo/repos",
//	"events_url": "https://api.github.com/users/mojombo/events{/privacy}",
//	"received_events_url": "https://api.github.com/users/mojombo/received_events",
//	"type": "User",
//	"site_admin": false
//}

@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *type;
@property (nonatomic) BOOL site_admin;
@property (nonatomic, strong) NSString *url_avatar;
@property (nonatomic, strong) NSString *url_html;
@property (nonatomic, strong) NSString *url_self;
@property (nonatomic, strong) NSString *url_followers;
@property (nonatomic, strong) NSString *url_following;
@property (nonatomic, strong) NSString *url_gists;
@property (nonatomic, strong) NSString *url_starred;
@property (nonatomic, strong) NSString *url_subscriptions;
@property (nonatomic, strong) NSString *url_organizations;
@property (nonatomic, strong) NSString *url_repos;
@property (nonatomic, strong) NSString *url_events;
@property (nonatomic, strong) NSString *url_received_events;

@end
