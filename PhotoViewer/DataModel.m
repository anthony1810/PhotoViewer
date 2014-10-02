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
        //init array
        imagesArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"enrique1.jpg"],[UIImage imageNamed:@"enrique2.jpg"],[UIImage imageNamed:@"pa1.jpg"],[UIImage imageNamed:@"pa2.jpg"], [UIImage imageNamed:@"troll1.jpg"],[UIImage imageNamed:@"troll2.jpg"], [UIImage imageNamed:@"wking1.jpg"],[UIImage imageNamed:@"wking2.jpg"], [UIImage imageNamed:@"wranger1.jpg"], [UIImage imageNamed:@"wranger2.jpg"], nil];
    }
    
    return self;
}

-(int) count{
    return imagesArray.count;
}

-(UIImage *) getImage:(int)index{
    
    if(imagesArray == nil){
        return nil;
    }else{
        return imagesArray[index];
    }
    
}


@end
