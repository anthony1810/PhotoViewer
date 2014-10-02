//
//  CollectionView.h
//  PhotoViewer
//
//  Created by FCS on 9/30/14.
//  Copyright (c) 2014 Floating Cube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionView : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSMutableArray *imgArrays;
@property (strong, nonatomic) NSMutableArray *imgNameArrays;
@property (weak, nonatomic) IBOutlet UIButton *backButton;


@end
