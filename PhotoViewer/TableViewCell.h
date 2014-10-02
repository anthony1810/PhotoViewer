//
//  TableViewCell.h
//  PhotoViewer
//
//  Created by FCS on 9/30/14.
//  Copyright (c) 2014 Floating Cube. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopUpImageView.h"

@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *firstImage;
@property (strong, nonatomic) IBOutlet UIImageView *secondImage;

-(void) initAndSetImages: (UIImage* ) firstImg andSecondImage: (UIImage *) secondImg;

@end
