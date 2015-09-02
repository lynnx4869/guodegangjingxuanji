//
//  RootViewController.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/2.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *titleArray = @[@"首页", @"听书城", @"下载听", @"订阅历史"];
    NSArray *imageArray = @[@"tabbar_sound_n", @"tabbar_bookcase_n", @"tabbar_download_n", @"tabbar_fav_n"];
    NSArray *selectArray = @[@"tabbar_sound_h", @"tabbar_bookcase_h", @"tabbar_download_h", @"tabbar_fav_h"];
    
    _tabbarBgImageView = [[TabBarImageView alloc] initWithFrame:CGRectMake(0, ScreenHeight-49, ScreenWidth, 49)];
    for(NSInteger i = 0; i < _tabbarBgImageView.btnsArray.count; i++){
        TabBarButtomView *btn = _tabbarBgImageView.btnsArray[i];
        btn.tag = 300 + i;
        btn.name.text = titleArray[i];
        btn.image.image = [UIImage imageNamed:imageArray[i]];
        btn.image.highlightedImage = [UIImage imageNamed:selectArray[i]];
        
        UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tabbarBtnClick:)];
        [btn addGestureRecognizer:gr];
    }
    [self.view addSubview:_tabbarBgImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabbarBtnClick:(UITapGestureRecognizer *)gr{
    TabBarButtomView *btn = (TabBarButtomView *)gr.view;
    self.tabBarController.selectedIndex = btn.tag - 300;
}

@end
