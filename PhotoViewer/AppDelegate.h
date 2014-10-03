//
//  AppDelegate.h
//  PhotoViewer
//
//  Created by FCS on 9/30/14.
//  Copyright (c) 2014 Floating Cube. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) DataModel* dataModel;

@property (strong, nonatomic) UIWindow *window;

@end
