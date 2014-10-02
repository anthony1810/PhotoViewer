//
//  TableViewCell.m
//  PhotoViewer
//
//  Created by FCS on 9/30/14.
//  Copyright (c) 2014 Floating Cube. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) initAndSetImages:(UIImage *)firstImg andSecondImage:(UIImage *)secondImg{
    
    if(!_firstImage)
        _firstImage = [[UIImageView alloc] init];
    
    if (!_secondImage)
        _secondImage = [[UIImageView alloc] init];
    
    _firstImage.image = firstImg;
    _secondImage.image = secondImg;
    
    //add tap gesture for first image
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageTap:)];
    tap.cancelsTouchesInView = YES;
    tap.numberOfTapsRequired = 1;
    _firstImage.userInteractionEnabled = true;
    [ _firstImage addGestureRecognizer:tap];
    
    //add gesture for second image
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageTap:)];
    tap2.cancelsTouchesInView = YES;
    tap2.numberOfTapsRequired = 1;
    _secondImage.userInteractionEnabled = true;
    [_secondImage addGestureRecognizer:tap2];
    
}

- (void) handleImageTap:(UIGestureRecognizer *)gestureRecognizer {
    PopUpImageView *popUpContainer = [[PopUpImageView alloc] init];
    if(gestureRecognizer.view == _firstImage){
        [popUpContainer popUp:_firstImage.image];
    }else{
        [popUpContainer popUp:_secondImage.image];
    }

}



@end
