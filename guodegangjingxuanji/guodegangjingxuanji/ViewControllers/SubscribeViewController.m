//
//  SubscribeViewController.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/2.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "SubscribeViewController.h"

@interface SubscribeViewController ()

@end

@implementation SubscribeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TabBarButtomView *btn = self.tabbarBgImageView.btnsArray[3];
    btn.isSelected = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
