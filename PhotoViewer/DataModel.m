//
//  DataModel.m
//  PhotoViewer
//
//  Created by FCS on 10/2/14.
//  Copyright (c) 2014 Floating Cube. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

-(void) initData{
    
    //init array
    _imagesArray = [[NSMutableArray alloc] init];
    
    //populate data into array
    [_imagesArray addObject:[UIImage imageNamed:@"enrique1.jpg"]];
    [_imagesArray addObject:[UIImage imageNamed:@"enrique2.jpg"]];
    [_imagesArray addObject:[UIImage imageNamed:@"pa1.jpg"]];
    [_imagesArray addObject:[UIImage imageNamed:@"pa2.jpg"]];
    [_imagesArray addObject:[UIImage imageNamed:@"troll1.jpg"]];
    [_imagesArray addObject:[UIImage imageNamed:@"troll2.jpg"]];
    [_imagesArray addObject:[UIImage imageNamed:@"wking1.jpg"]];
    [_imagesArray addObject:[UIImage imageNamed:@"wking2.jpg"]];
    [_imagesArray addObject:[UIImage imageNamed:@"wranger1.jpg"]];
    [_imagesArray addObject:[UIImage imageNamed:@"wranger2.jpg"]];
}

-(UIImage *) getImage:(int)index{
    
    if(_imagesArray == nil){
        return nil;
    }else{
        return _imagesArray[index];
    }
    
}

-(void) addImages:(UIImage *)image{
    if(_imagesArray != nil)
        [_imagesArray addObject:image];
}

-(void) removeImages:(UIImage *)image{
    if(_imagesArray != nil)
        [_imagesArray removeObject:image];
}

@end
