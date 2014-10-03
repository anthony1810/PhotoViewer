//
//  CollectionView.h
//  PhotoViewer
//
//  Created by FCS on 9/30/14.
//  Copyright (c) 2014 Floating Cube. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopUpImageView.h"
#import "DataModel.h"
#import "AppDelegate.h"

@interface CollectionView : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *backButton;


@end
