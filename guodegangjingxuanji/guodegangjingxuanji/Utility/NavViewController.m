//
//  NavViewController.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/6.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "NavViewController.h"

@interface NavViewController () <UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIViewController *curVc;

@end

@implementation NavViewController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    if(self = [super initWithRootViewController:rootViewController]){
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_bg_64"] forBarMetrics:UIBarMetricsDefault];
        
        self.interactivePopGestureRecognizer.delegate = self;
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if(self.viewControllers.count == 1){
        _curVc = nil;
    }else{
        _curVc = viewController;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if(gestureRecognizer == self.interactivePopGestureRecognizer){
        return (_curVc == self.topViewController);
    }else{
        return YES;
    }
}

@end
