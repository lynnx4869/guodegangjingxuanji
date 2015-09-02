//
//  MainTabbarViewController.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/2.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "MainTabbarViewController.h"
#import "HomeViewController.h"
#import "CategoryViewController.h"
#import "DownloadViewController.h"
#import "SubscribeViewController.h"

@interface MainTabbarViewController ()

@end

@implementation MainTabbarViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *ctrlArray = @[@"HomeViewController", @"CategoryViewController", @"DownloadViewController", @"SubscribeViewController"];
    
    NSMutableArray *array = [NSMutableArray array];
    for(NSInteger i = 0; i < ctrlArray.count; i++){
        NSString *ctrlString = ctrlArray[i];
        Class cls = NSClassFromString(ctrlString);
        UIViewController *vc = [[cls alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [array addObject:nav];
    }
    self.viewControllers = [NSArray arrayWithArray:array];
    
    self.tabBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
