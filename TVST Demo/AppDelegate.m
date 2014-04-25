//
//  AppDelegate.m
//  TVST Demo
//
//  Created by Talal on 24/04/2014.
//  Copyright (c) 2014 Talal. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "TVSTShow.h"
#import "TVSTComment.h"
#import "TVSTUser.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    MainViewController *mainVC = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:mainVC];
    
    self.window.rootViewController = navC;
    
    [self initMapping];

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) initMapping
{
    self.objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:kApiUrl]];
    [RKObjectManager setSharedManager:self.objectManager];
    
    RKObjectMapping* userMapping = [RKObjectMapping mappingForClass:[TVSTUser class]];
    [userMapping addAttributeMappingsFromDictionary:@{@"id": @"userID",
                                                      @"name":@"name"}];

    RKObjectMapping* commentMapping = [RKObjectMapping mappingForClass:[TVSTComment class]];
    [commentMapping addAttributeMappingsFromDictionary:@{@"date": @"date",
                                                         @"content":@"content"}];
    [commentMapping addRelationshipMappingWithSourceKeyPath:@"user" mapping:userMapping];

    RKObjectMapping* showMapping = [RKObjectMapping mappingForClass:[TVSTShow class]];
    [showMapping addAttributeMappingsFromDictionary:@{@"id": @"showID",
                                                      @"name":@"name",
                                                      @"overview":@"overview"}];
    [showMapping addRelationshipMappingWithSourceKeyPath:@"comments" mapping:commentMapping];
}

+ (RKMapping *) userMapping
{
    RKObjectMapping* userMapping = [RKObjectMapping mappingForClass:[TVSTUser class]];
    [userMapping addAttributeMappingsFromDictionary:@{@"id": @"userID",
                                                      @"name":@"name"}];
    
    RKObjectMapping* commentMapping = [RKObjectMapping mappingForClass:[TVSTComment class]];
    [commentMapping addAttributeMappingsFromDictionary:@{@"date": @"date",
                                                         @"content":@"content"}];
    [commentMapping addRelationshipMappingWithSourceKeyPath:@"user" mapping:userMapping];
    
    RKObjectMapping* showMapping = [RKObjectMapping mappingForClass:[TVSTShow class]];
    [showMapping addAttributeMappingsFromDictionary:@{@"id": @"showID",
                                                      @"name":@"name",
                                                      @"overview":@"overview"}];
    [showMapping addRelationshipMappingWithSourceKeyPath:@"comments" mapping:commentMapping];

    return userMapping;
}

+ (RKMapping *) showMapping
{
    RKObjectMapping* userMapping = [RKObjectMapping mappingForClass:[TVSTUser class]];
    [userMapping addAttributeMappingsFromDictionary:@{@"id": @"userID",
                                                      @"name":@"name"}];
    
    RKObjectMapping* commentMapping = [RKObjectMapping mappingForClass:[TVSTComment class]];
    [commentMapping addAttributeMappingsFromDictionary:@{@"date": @"date",
                                                         @"content":@"content"}];
    [commentMapping addRelationshipMappingWithSourceKeyPath:@"user" mapping:userMapping];
    
    RKObjectMapping* showMapping = [RKObjectMapping mappingForClass:[TVSTShow class]];
    [showMapping addAttributeMappingsFromDictionary:@{@"id": @"showID",
                                                      @"name":@"name",
                                                      @"overview":@"overview"}];
    [showMapping addRelationshipMappingWithSourceKeyPath:@"comments" mapping:commentMapping];

    return showMapping;
}

+ (RKMapping *) commentMapping
{
    RKObjectMapping* userMapping = [RKObjectMapping mappingForClass:[TVSTUser class]];
    [userMapping addAttributeMappingsFromDictionary:@{@"id": @"userID",
                                                      @"name":@"name"}];
    
    RKObjectMapping* commentMapping = [RKObjectMapping mappingForClass:[TVSTComment class]];
    [commentMapping addAttributeMappingsFromDictionary:@{@"id":@"commentID",
                                                         @"date": @"date",
                                                         @"content":@"content"}];
    [commentMapping addRelationshipMappingWithSourceKeyPath:@"user" mapping:userMapping];
    
    RKObjectMapping* showMapping = [RKObjectMapping mappingForClass:[TVSTShow class]];
    [showMapping addAttributeMappingsFromDictionary:@{@"id": @"showID",
                                                      @"name":@"name",
                                                      @"overview":@"overview"}];
    [showMapping addRelationshipMappingWithSourceKeyPath:@"comments" mapping:commentMapping];

    return commentMapping;
}


@end
