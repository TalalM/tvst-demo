//
//  AppDelegate.h
//  TVST Demo
//
//  Created by Talal on 24/04/2014.
//  Copyright (c) 2014 Talal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) RKObjectManager *objectManager;

+ (RKMapping *) userMapping;
+ (RKMapping *) showMapping;
+ (RKMapping *) commentMapping;

@end
