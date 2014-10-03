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
        //get screen size
        screenRect = [[UIScreen mainScreen] bounds];
        screenWidth = screenRect.size.width - 20;
        screenHeight = screenRect.size.height-100;
            }
    return self;
}


-(void) popUp:(UIImage *)image{
    
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
         _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0,0,screenWidth,screenHeight)];
    }
    [self setImgViewProperties];
    [self addSubview:_imageView];
    
    [self setFrame: CGRectMake(0, 0,screenWidth, screenHeight)];
    [_scrollView addSubview:self];

    [_popUpContainer setContainerView: _scrollView];
    [self setImgViewProperties];
    [self setScrollViewProperties];
    
    // Modify the parameters
    [_popUpContainer setButtonTitles:[NSMutableArray arrayWithObjects:@"Close", nil]];
    
    [_popUpContainer setUseMotionEffects:true];
    // And launch the dialog
    [_popUpContainer show];
   
    
}

-(void) setImgViewProperties{
    [_imageView setBackgroundColor:[UIColor blackColor]];
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
   
    //_scrollView.autoresizesSubviews = true;
   _scrollView.delegate = self;
    _scrollView.minimumZoomScale = 0.5;
   _scrollView.maximumZoomScale = 6.0;

    [_scrollView setClipsToBounds:true];
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
}


- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    [self centerContent];
}

#pragma mark - Delegate method for handling pinch
- (UIImageView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
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
