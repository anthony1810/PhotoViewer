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
    
    self.scrollView.contentSize = image.size;
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 6.0;

    _scrollView.showsVerticalScrollIndicator=YES;
    _scrollView.scrollEnabled=YES;
    _scrollView.userInteractionEnabled=YES;
    [_scrollView setBouncesZoom:YES];

    
    // Modify the parameters
    [_popUpContainer setButtonTitles:[NSMutableArray arrayWithObjects:@"Close", nil]];
    
    [_popUpContainer setUseMotionEffects:true];
    // And launch the dialog
    [_popUpContainer show];
   
    
}


- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    
    [self centerscrollViewContents];
    NSLog(@"%@", @"aftert zoom");
}


#pragma mark - Delegate method for handling pinch
- (UIImageView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"%@", @"pinch!");
    return self.imageView;
}


#pragma mark - Center the image when users pinch in/out

- (void)centerscrollViewContents {
    CGSize boundsSize = _scrollView.bounds.size;
    CGRect contentsFrame = _popUpContainer.frame;
    
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
