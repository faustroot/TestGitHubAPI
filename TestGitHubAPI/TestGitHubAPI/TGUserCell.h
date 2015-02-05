//
//  TGUserCell.h
//  TestGitHubAPI
//
//  Created by Боев Александр on 2/5/15.
//  Copyright (c) 2015 Боев Александр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TGUser.h"

@interface TGUserCell : UITableViewCell

- (void)configCellForUser:(TGUser*)aUser;

@end
