//
//  TGUserCell.m
//  TestGitHubAPI
//
//  Created by Боев Александр on 2/5/15.
//  Copyright (c) 2015 Боев Александр. All rights reserved.
//

#import "TGUserCell.h"
#import "TGMacros.h"
#import <UIImageView+AFNetworking.h>

@interface TGUserCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewAvatar;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelUrl;

@end

@implementation TGUserCell

- (void)awakeFromNib
{
	[super awakeFromNib];
	
	self.imageViewAvatar.layer.cornerRadius = self.imageViewAvatar.frame.size.height * 0.5f;
	self.imageViewAvatar.clipsToBounds = YES;
	self.imageViewAvatar.layer.borderWidth = 1.f;
	self.imageViewAvatar.layer.borderColor = [RGB(158.f, 204.f, 73.f) CGColor];
}

- (void)configCellForUser:(TGUser *)aUser
{
	self.labelName.text = aUser.login;
	self.labelUrl.text = aUser.url_html;
	
	[self.imageViewAvatar setImageWithURL:[aUser urlAvatarForSize:100]
						 placeholderImage:[UIImage new]];
}

@end
