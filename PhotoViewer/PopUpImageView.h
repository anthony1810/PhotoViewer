//
//  PopUpImageView.h
//  PhotoViewer
//
//  Created by FCS on 10/2/14.
//  Copyright (c) 2014 Floating Cube. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomIOS7AlertView.h"


@interface PopUpImageView : UIView <UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView* scrollView;
@property (strong, nonatomic) CustomIOS7AlertView* popUpContainer;

@property (strong, nonatomic) UIImage *anImage;
@property (strong, nonatomic) UIImageView *imageView;

-(void) popUp: (UIImage *) image;


@end
