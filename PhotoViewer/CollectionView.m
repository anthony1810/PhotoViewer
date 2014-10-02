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
    
    currentItemChose = 0;
    _imgArrays = [[NSMutableArray alloc] initWithObjects:@"enrique1.jpg",@"pa1.jpg",@"troll1.jpg",@"wking1.png",@"wranger1.jpg",@"enrique2.jpg",@"pa2.jpg",@"troll2.jpg",@"wking2.jpg",@"wranger2.jpg", nil];
    _imgNameArrays = [[NSMutableArray alloc] initWithObjects:@"Enrique Iglesias",@"Phantom Assassin",@"Troll Warlord",@"Wraith King",@"Windranger",@"Enrique iglesias",@"Phantom Assassin",@"Troll Warlord",@"Wraith King",@"Windranger", nil];

    //add bar button
    self.view.backgroundColor = [UIColor blackColor];
    //[self.navigationController pushViewController:self animated:true];
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
    return _imgArrays.count;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    UIImageView* imgCell = (UIImageView*) [cell viewWithTag:100];
    imgCell.image=[UIImage imageNamed:[_imgArrays objectAtIndex:indexPath.row]];
    
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
    NSLog(@"%i", indexPath.row);
    
    //Pop up view
    //create UIView
    demoView = [[UIView alloc] init];
    
    //get screen size
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width - 20;
    CGFloat screenHeight = screenRect.size.height-100;
    
    //create Image
    UIImage *image;
    
    //get image original size
    CGSize imageSize;
    
    image = [UIImage imageNamed:_imgArrays[indexPath.row]];
    imageSize = image.size;

    //        //initialise imageView
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageSize.width, imageSize.height)];
    [imageView setImage:image];
    if(imageSize.width <= screenWidth || imageSize.height <=screenHeight){
        [imageView setFrame:CGRectMake(0, 0, imageSize.width, imageSize.height)];
        scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,imageSize.width,imageSize.height)];
    }else{
        [imageView setFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
        scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,screenWidth,screenHeight)];
    }
    
    
    [demoView setFrame: CGRectMake(0, 0,screenWidth, screenHeight)];
    
    //initialise scrollView
    
    scrollView.showsVerticalScrollIndicator=YES;
    scrollView.scrollEnabled=YES;
    scrollView.userInteractionEnabled=YES;
    [scrollView setBouncesZoom:YES];
    scrollView.contentSize = CGSizeMake(imageSize.width,imageSize.height);
    scrollView.minimumZoomScale=0.5;
    scrollView.maximumZoomScale=6.0;
    scrollView.contentSize=CGSizeMake(1280, 960);
    scrollView.delegate=self;
    scrollView.autoresizesSubviews = true;
    //create a view to show picture
    
    
    //add imageview
    [demoView addSubview:imageView];
    
    //add scollview
    [scrollView addSubview:demoView];
    
//    //create a pop up view to contain the above uiview
//    CustomIOS7AlertView *alertView = [[CustomIOS7AlertView alloc] init];
//    
//    // Add some custom content to the alert view
//    [alertView setContainerView: scrollView];
//    
//    // Modify the parameters
//    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"Close", nil]];
//    
//    // You may use a Block, rather than a delegate.
//    //    [alertView setOnButtonTouchUpInside:^(CustomIOS7AlertView *alertView, int buttonIndex) {
//    //        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertView tag]);
//    //        [alertView close];
//    //    }];
//    
//    [alertView setUseMotionEffects:true];
//    
//    // And launch the dialog
//    [alertView show];
//    
//    currentItemChose = indexPath.row;
//}
//
//
//#pragma mark Navigation Handle (deprecated)
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    //showDetailFromCollectionView
//    if([[segue identifier] isEqualToString:@"showDetailFromCollectionView"]){
//        PhotoViewController *detailPhotoView = [segue destinationViewController];
//        long row = currentItemChose;
//        detailPhotoView.photoDetailModel = @[_imgNameArrays[row],_imgArrays[row], _imgArrays[row]];
    //}
}


#pragma mark Reaction when pinch (zoom in/out)
- (UIView *)viewForZoomingInscrollView:(UIScrollView *)scrollView
{
    NSLog(@"%@", @"haha");
    return imageView;
}

#pragma mark Center the imgage after pinch
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    
    // center the image as it becomes smaller than the size of the screen
    CGSize boundsSize = scrollView.bounds.size;
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
