//
//  TGMainTableViewController.m
//  TestGitHubAPI
//
//  Created by Боев Александр on 2/4/15.
//  Copyright (c) 2015 Боев Александр. All rights reserved.
//

#import "TGMainTableViewController.h"
#import "TGUserCell.h"
#import "TGUser.h"
#import "TGDataManager.h"

#define CELL_IDENTIFIRE @"userIdentifireCell"

@interface TGMainTableViewController ()

@property (nonatomic, strong) NSArray* arrayUsers;

@end

@implementation TGMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	self.arrayUsers = [NSArray array];
	
	__weak typeof(self) weakSelf = self;
	[[TGDataManager sharedManager] loadGitHubUsersWithSuccess:^(NSArray *users)
	{
		dispatch_async(dispatch_get_main_queue(), ^ {
			weakSelf.arrayUsers = users;
			[weakSelf.tableView reloadData];
		});
	}
													  failure:^(NSError *error)
	{
		[[[UIAlertView alloc] initWithTitle:@"Error"
									message:error.localizedDescription
								   delegate:nil
						  cancelButtonTitle:@"Ok"
						  otherButtonTitles:nil] show];
	}];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayUsers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
    TGUserCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIRE
															forIndexPath:indexPath];
	
	[cell configCellForUser:[self.arrayUsers objectAtIndex:indexPath.row]];
	
    return cell;
}

@end
