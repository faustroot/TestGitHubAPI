//
//  TGUser.h
//  TestGitHubAPI
//
//  Created by Боев Александр on 2/4/15.
//  Copyright (c) 2015 Боев Александр. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGUser : NSObject

@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *url_avatar;
@property (nonatomic, strong) NSString *url_html;
/*
 Other parametrs can be add when needed
 */

- (id)initWithDictionary:(NSDictionary*)aDictionary;
- (NSURL*)urlAvatarForSize:(NSInteger)aSize;

@end
