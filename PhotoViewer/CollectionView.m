//
//  CollectionView.m
//  PhotoViewer
//
//  Created by FCS on 9/30/14.
//  Copyright (c) 2014 Floating Cube. All rights reserved.
//

#import "CollectionView.h"

@interface CollectionView (){
    
    int currentItemChose;
    
    //create UIImageView
    UIImageView *imageView;
    
    //create a scrollView to contain the uiview above
    UIScrollView* scrollView;
    
    //create uiview that contain the imageview
    UIView *demoView;
    
    //Data Model
    DataModel *dataModel;
}


@end

@implementation CollectionView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:true animated:YES];
    
    [self initView];

    //add bar button
    self.view.backgroundColor = [UIColor blackColor];
    //[self.navigationController pushViewController:self animated:true];
}

-(void) initView{
    currentItemChose = 0;
    AppDelegate* appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    dataModel = [appDelegate dataModel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Collection View Methods
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return dataModel.count;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    UIImageView* imgCell = (UIImageView*) [cell viewWithTag:100];
    imgCell.image=[dataModel getImage:indexPath.row];
    
    [cell.layer setBorderWidth:2.0f];
    [cell.layer setBorderColor:[UIColor whiteColor].CGColor];
    [cell.layer setCornerRadius:35.0f];
    
    return cell;
}


#pragma mark Back Button Event
- (IBAction)backPressEvent:(id)sender {
    [self.navigationController popToRootViewControllerAnimated: YES];
    NSLog(@"%s","Event recieve");
}


#pragma mark Reaction When an item is tapped
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PopUpImageView *popUpContainer = [[PopUpImageView alloc] init];
    [popUpContainer popUp: [dataModel getImage:indexPath.row]];
}


#pragma mark Reaction when pinch (zoom in/out)
- (UIView *)viewForZoomingInscrollView:(UIScrollView *)scrollView
{
    NSLog(@"%@", @"haha");
    return imageView;
}

#pragma mark Center the imgage after pinch
- (void)scrollViewDidZoom:(UIScrollView *)scrollView1
{
    
    // center the image as it becomes smaller than the size of the screen
    CGSize boundsSize = scrollView1.bounds.size;
    CGRect frameToCenter = imageView.frame;
    
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width)
    {
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    } else {
        frameToCenter.origin.x = 0;
    }
    
    // center vertically
    if (frameToCenter.size.height < boundsSize.height)
    {
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    } else {
        frameToCenter.origin.y = 0;
    }
    
    imageView.frame = frameToCenter;
    
}

@end
