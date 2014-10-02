//
//  TableViewController.m
//  PhotoViewer
//
//  Created by FCS on 9/30/14.
//  Copyright (c) 2014 Floating Cube. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"



@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _firstImagesArray = @[@"enrique1.jpg",@"pa1.jpg",@"troll1.jpg",@"wking1.png",@"wranger1.jpg"];
    _secondImageArray = @[@"enrique2.jpg",@"pa2.jpg",@"troll2.jpg",@"wking2.jpg",@"wranger2.jpg"];
    _heroNameArray = @[@"Enrique Iglesias",@"Phantom Assassin",@"Troll Warlord",@"Wraith King",@"Windranger"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _firstImagesArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"photoTableCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    long row = [indexPath row];
    [cell initAndSetImages:[UIImage imageNamed:_firstImagesArray[row]] andSecondImage:[UIImage imageNamed:_secondImageArray[row]]];
    
    return cell;
}


//#pragma mark - Navigation Method
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    //showDetailFromCollectionView
//    if([[segue identifier] isEqualToString:@"showPhotoDetails"]){
//        PhotoViewController *detailPhotoView = [segue destinationViewController];
//        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
//        long row = [myIndexPath row];
//        detailPhotoView.photoDetailModel = @[_heroNameArray[row],_firstImagesArray[row], _secondImageArray[row]];
//    }
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end