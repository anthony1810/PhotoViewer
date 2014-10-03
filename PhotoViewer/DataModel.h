//
//  DataModel.h
//  PhotoViewer
//
//  Created by FCS on 10/2/14.
//  Copyright (c) 2014 Floating Cube. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

-(UIImage *)getImage: (int) index;
-(int) getImgArraySize;

@end
