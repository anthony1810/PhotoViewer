//
//  DataModel.h
//  PhotoViewer
//
//  Created by FCS on 10/2/14.
//  Copyright (c) 2014 Floating Cube. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (strong, nonatomic) NSMutableArray* imagesArray;

-(void) initData;

-(UIImage *)getImage: (int) index;
-(void) addImages: (UIImage *) image;
-(void) removeImages: (UIImage *) image;

@end
