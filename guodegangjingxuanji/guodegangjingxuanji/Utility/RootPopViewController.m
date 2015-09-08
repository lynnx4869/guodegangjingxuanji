//
//  RootPopViewController.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/6.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "RootPopViewController.h"

@interface RootPopViewController ()

@end

@implementation RootPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 20, 20);
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_setting_n"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_setting_h"] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(gotoSetting:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"view_background"]];
    
    _toolsImageView = [[ToolsImageView alloc] initWithFrame:CGRectMake(0, ScreenHeight-49, ScreenWidth, 49)];
    UIButton *backBtn = _toolsImageView.btnsArray[0];
    [backBtn setImage:[UIImage imageNamed:@"btn_back_n"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"btn_back_h"] forState:UIControlStateHighlighted];
    [backBtn addTarget:self action:@selector(gotoPop:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_toolsImageView];
    
    [self.navigationItem setHidesBackButton:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gotoPop:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)gotoSetting:(UIButton *)btn{
    
}

@end
