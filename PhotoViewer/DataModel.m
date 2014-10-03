//
//  DataModel.m
//  PhotoViewer
//
//  Created by FCS on 10/2/14.
//  Copyright (c) 2014 Floating Cube. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel
{
    NSArray* imagesArray;
}

-(instancetype) init{
    
    self = [super init];
    if(self){
        imagesArray = [[NSArray alloc] initWithObjects:@"enrique1.jpg",@"enrique2.jpg",@"pa1.jpg",@"pa2.jpg", @"troll1.jpg",@"troll2.jpg", @"wking1.png",@"wking2.jpg", @"wranger1.jpg", @"wranger2.jpg",@"arthas.jpg",@"illidant.jpg", @"involker.jpg",nil];
    }
    
    return self;
}

-(int) getImgArraySize{
    return imagesArray.count;
}

-(UIImage *) getImage:(int)index{
    
    if(imagesArray == nil){
        return nil;
    }else{
        return [UIImage imageNamed: imagesArray[index]];
    }
    
}


@end
