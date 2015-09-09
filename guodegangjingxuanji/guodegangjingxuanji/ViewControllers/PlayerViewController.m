//
//  PlayerViewController.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/8.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "PlayerViewController.h"
#import "ToolsImageView.h"
#import "AppDelegate.h"

@interface PlayerViewController ()

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"view_background"]];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.imageView.hidden = YES;
    
    [self createTools];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createTools{
    UIImageView *toolsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, ScreenHeight-49, ScreenWidth, 49)];
    toolsImageView.userInteractionEnabled = YES;
    toolsImageView.image = [UIImage imageNamed:@"tabbar_bg"];
    
    CGFloat space = (ScreenWidth - 250) / 6;
    NSArray *imageArray = @[@"np_toolbar_back_n", @"np_toolbar_alarm_n", @"np_toolbar_sleep_n", @"np_toolbar_download_n", @"np_toolbar_share_n"];
    NSArray *highArray = @[@"np_toolbar_back_h", @"np_toolbar_alarm_h", @"np_toolbar_sleep_h", @"np_toolbar_download_h", @"np_toolbar_share_h"];
    
    for(NSInteger i = 0; i < 5; i++){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((50+space)*i+space, 0, 50, 49);
        btn.tag = 400 + i;
        btn.imageEdgeInsets = UIEdgeInsetsMake(5, -5, 5, -5);
        [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:highArray[i]] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(clickTools:) forControlEvents:UIControlEventTouchUpInside];
        [toolsImageView addSubview:btn];
    }
    
    [self.view addSubview:toolsImageView];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.imageView.hidden = NO;
}

#pragma mark - ClickAction
- (void)clickTools:(UIButton *)btn{
    switch (btn.tag - 400) {
        case 0:
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        default:
            break;
    }
}

@end
