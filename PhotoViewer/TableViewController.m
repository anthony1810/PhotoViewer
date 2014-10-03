//
//  TableViewController.m
//  PhotoViewer
//
//  Created by FCS on 9/30/14.
//  Copyright (c) 2014 Floating Cube. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"



@interface TableViewController (){
    DataModel *dataModel;
    int rowPosition;
    int cellDrawingCounter;
}

@end

@implementation TableViewController

-(instancetype) init{
    self = [super init];
    if(self){
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate* appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    dataModel = [appDelegate dataModel];
    rowPosition = 0;
    [self setTableViewPropeties];
}

-(void) setTableViewPropeties{
    //remove line seperator
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return dataModel.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"photoTableCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if(rowPosition+1 < dataModel.count){
        [cell initAndSetFirstImages:[dataModel getImage:rowPosition]];
        rowPosition ++;
        [cell initAndSetSecondImages:[dataModel getImage:rowPosition]];
        rowPosition++;
    }else if(rowPosition < dataModel.count){
        [cell initAndSetFirstImages:[dataModel getImage:rowPosition]];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10; // you can have your own choice, of course
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    // To "clear" the footer view
    return [UIView new];
}

@end
