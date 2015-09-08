//
//  AppDelegate.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/2.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabbarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    MainTabbarViewController *mvc = [[MainTabbarViewController alloc] init];
    self.window.rootViewController = mvc;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth-70)/2, ScreenHeight-69, 70, 69)];
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:@"tabbar_np_normal"];
    [self.window addSubview:imageView];
    
    UIButton *playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    playBtn.frame = CGRectMake(15, 15, 40, 45);
    [playBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_np_icon"] forState:UIControlStateNormal];
    [playBtn setImage:[UIImage imageNamed:@"tabbar_np_play"] forState:UIControlStateNormal];
    [imageView addSubview:playBtn];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
