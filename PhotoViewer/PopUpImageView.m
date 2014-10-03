//
//  PopUpImageView.m
//  PhotoViewer
//
//  Created by FCS on 10/2/14.
//  Copyright (c) 2014 Floating Cube. All rights reserved.
//

#import "PopUpImageView.h"

@implementation PopUpImageView{
    CGRect screenRect;
    CGFloat screenWidth;
    CGFloat screenHeight;
}

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
     screenRect = [[UIScreen mainScreen] bounds];
     screenWidth = screenRect.size.width - 20;
     screenHeight = screenRect.size.height-100;
    
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
    
    [self setScrollViewProperties];
    
    // Modify the parameters
    [_popUpContainer setButtonTitles:[NSMutableArray arrayWithObjects:@"Close", nil]];
    
    [_popUpContainer setUseMotionEffects:true];
    // And launch the dialog
    [_popUpContainer show];
   
    
}

-(void) setScrollViewProperties{
    
    //set scrollview content size to fit the size of image
    if(_anImage.size.width <= screenWidth || _anImage.size.height <=screenHeight){
         _scrollView.contentSize = _anImage.size;
    }else{
        screenRect.size.width -= 20;
        screenRect.size.height -= 100;
        _scrollView.contentSize = screenRect.size;
    }
   
   
   _scrollView.delegate = self;
    _scrollView.minimumZoomScale = 0.5;
   _scrollView.maximumZoomScale = 6.0;
    
//    _scrollView.showsVerticalScrollIndicator=YES;
//    _scrollView.scrollEnabled=YES;
//    _scrollView.userInteractionEnabled=YES;
//    [_scrollView setBouncesZoom:YES];
    [_scrollView setClipsToBounds:true];
    //[_scrollView setFrame:self.bounds];
    //_scrollView.backgroundColor = [UIColor colorWithRed:1.000 green:0.992 blue:0.841 alpha:1.000];
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
}


- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    [self centerContent];
    NSLog(@"%@", @"aftert zoom");
}

#pragma mark - Delegate method for handling pinch
- (UIImageView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"%@", @"pinch!");
    return self.imageView;
}


#pragma mark - Center the image when users pinch in/out

- (void)centerContent {
    CGFloat top = 0, left = 0;
    if (_scrollView.contentSize.width < self.bounds.size.width) {
        left = (self.bounds.size.width-_scrollView.contentSize.width) * 0.5f;
    }
    if (_scrollView.contentSize.height < _scrollView.bounds.size.height) {
        top = (_scrollView.bounds.size.height-_scrollView.contentSize.height) * 0.5f;
    }
    _scrollView.contentInset = UIEdgeInsetsMake(top, left, top, left);
}


@end
