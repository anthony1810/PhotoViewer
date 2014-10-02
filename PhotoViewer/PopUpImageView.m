//
//  PopUpImageView.m
//  PhotoViewer
//
//  Created by FCS on 10/2/14.
//  Copyright (c) 2014 Floating Cube. All rights reserved.
//

#import "PopUpImageView.h"

@implementation PopUpImageView

-(instancetype) init{
    self = [super init];
    if (self) {
        _anImage = [[UIImage alloc] init];
        _imageView = [[UIImageView alloc] init];
        
        _scrollView =[[UIScrollView alloc]init];
        _scrollView.showsVerticalScrollIndicator=YES;
        _scrollView.scrollEnabled=YES;
        _scrollView.userInteractionEnabled=YES;
        [_scrollView setBouncesZoom:YES];
        _scrollView.minimumZoomScale=0.5;
        _scrollView.maximumZoomScale=6.0;
        _scrollView.contentSize=CGSizeMake(1280, 960);
        
        _scrollView.delegate = self;
        _popUpContainer = [[CustomIOS7AlertView alloc] init];
        

    }
    return self;
}


-(void) popUp:(UIImage *)image{
    
    //get screen size
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width - 20;
    CGFloat screenHeight = screenRect.size.height-100;
    
    _anImage = image;
    [_imageView setImage: _anImage];
    
    //get image original size
    CGSize imageSize = _anImage.size;

    if(imageSize.width <= screenWidth || imageSize.height <=screenHeight){
        [self setFrame:CGRectMake(0, 0, imageSize.width, imageSize.height)];
        [_imageView setFrame:CGRectMake(0,0,imageSize.width,imageSize.height)];

        _scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,imageSize.width,imageSize.height)];
    }else{
        [self setFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
        [_imageView setFrame:CGRectMake(0,0,screenWidth,screenHeight)];
        _scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,screenWidth,screenHeight)];
    }
    [self addSubview:_imageView];
    
    [self setFrame: CGRectMake(0, 0,screenWidth, screenHeight)];
    [_scrollView addSubview:self];
    
    [_popUpContainer setContainerView: _scrollView];
    
    // Modify the parameters
    [_popUpContainer setButtonTitles:[NSMutableArray arrayWithObjects:@"Close", nil]];
    
    [_popUpContainer setUseMotionEffects:true];
    
    // And launch the dialog
    [_popUpContainer show];
    [self centerscrollViewContents];
    
}


- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    
    // center the image as it becomes smaller than the size of the screen
    CGSize boundsSize = scrollView.bounds.size;
    CGRect frameToCenter = self.frame;
    
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
    
    self.frame = frameToCenter;
    
}


#pragma mark - Reaction When Double tap a image
- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer {
    // 1
    CGPoint pointInView = [recognizer locationInView:self];
    
    // 2
    CGFloat newZoomScale = _scrollView.zoomScale * 1.5f;
    newZoomScale = MIN(newZoomScale, _scrollView.maximumZoomScale);
    
    // 3
    CGSize scrollViewSize = _scrollView.bounds.size;
    
    CGFloat w = scrollViewSize.width / newZoomScale;
    CGFloat h = scrollViewSize.height / newZoomScale;
    CGFloat x = pointInView.x - (w / 2.0f);
    CGFloat y = pointInView.y - (h / 2.0f);
    
    CGRect rectToZoomTo = CGRectMake(x, y, w, h);
    
    // 4
    [_scrollView zoomToRect:rectToZoomTo animated:YES];
    NSLog(@"%@", @"double tap detected!");
}


#pragma mark - Delegate method for handling pinch
- (UIView *)viewForZoomingInscrollView:(UIScrollView *)scrollView
{
    NSLog(@"%@", @"pinch!");
    return self;
}


#pragma mark - Center the image when users pinch in/out

- (void)centerscrollViewContents {
    CGSize boundsSize = _scrollView.bounds.size;
    CGRect contentsFrame = _scrollView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    
    _scrollView.frame = contentsFrame;
}

@end
