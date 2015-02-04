//
//  TGMainTableViewController.m
//  TestGitHubAPI
//
//  Created by Боев Александр on 2/4/15.
//  Copyright (c) 2015 Боев Александр. All rights reserved.
//

#import "TGMainTableViewController.h"

#define CELL_IDENTIFIRE @"userIdentifireCell"

@interface TGMainTableViewController ()

@end

@implementation TGMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIRE
															forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

@end
