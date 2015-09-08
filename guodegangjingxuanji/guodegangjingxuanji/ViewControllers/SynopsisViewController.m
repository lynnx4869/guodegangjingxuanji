//
//  SynopsisViewController.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/7.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "SynopsisViewController.h"

@interface SynopsisViewController ()

@end

@implementation SynopsisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem =  nil;
    self.navigationItem.title = _navTitle;
    
    UIButton *btn = self.toolsImageView.btnsArray[3];
    [btn setImage:[UIImage imageNamed:@"btn_home_n"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"btn_home_h"] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(gotoRootView:) forControlEvents:UIControlEventTouchUpInside];
    
    CGRect frame = [_synopsis boundingRectWithSize:CGSizeMake(ScreenWidth-60, CGFLOAT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}
                                           context:nil];
    frame.origin.x = 20;
    frame.origin.y = 20;
    
    UIImageView *bgView = [[UIImageView alloc] init];
    if(152*(ScreenWidth-20)/320 > frame.size.height){
        bgView.frame = CGRectMake(10, 74, ScreenWidth-20, 152*(ScreenWidth-20)/320);
    }else{
        bgView.frame = CGRectMake(10, 74, ScreenWidth-20, frame.size.height+40);
    }
    bgView.image = [UIImage imageNamed:@"bg_album_detail_text"];
    [self.view addSubview:bgView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.numberOfLines = 0;
    label.text = _synopsis;
    label.font = [UIFont systemFontOfSize:14];
    [bgView addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)gotoRootView:(UIButton *)btn{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
