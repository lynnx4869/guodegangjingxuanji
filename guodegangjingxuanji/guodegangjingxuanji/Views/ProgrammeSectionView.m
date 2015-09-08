//
//  ProgrammeSectionView.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/7.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "ProgrammeSectionView.h"

@implementation ProgrammeSectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
        bgImageView.image = [UIImage imageNamed:@"bg_albumView_tab"];
        [self addSubview:bgImageView];
        
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.frame = CGRectMake(50, 0, 50, 40);
        [_leftBtn setBackgroundImage:[UIImage imageNamed:@"bg_albumView_tab_arrow"] forState:UIControlStateSelected];
        [_leftBtn setTitle:@"简介" forState:UIControlStateNormal];
        [_leftBtn setTitle:@"简介" forState:UIControlStateSelected];
        _leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_leftBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [_leftBtn addTarget:self action:@selector(clickLeftBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftBtn];
        
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame = CGRectMake(150, 0, 70, 40);
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"bg_albumView_tab_arrow"] forState:UIControlStateSelected];
        [_rightBtn setImage:[UIImage imageNamed:@"mark_albumsound_reverse"] forState:UIControlStateSelected];
        [_rightBtn setTitle:@"列表" forState:UIControlStateNormal];
        [_rightBtn setTitle:@"" forState:UIControlStateSelected];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(clickRightBtn) forControlEvents:UIControlEventTouchUpInside];
        _rightBtn.selected = YES;
        [self addSubview:_rightBtn];
    }
    return self;
}

- (void)clickLeftBtn{
    if(_leftBtn.selected){
        return ;
    }
    _leftBtn.selected = YES;
    _rightBtn.selected = NO;
    if(_delegate){
        [_delegate selectTabWithLeft:YES];
    }
}

- (void)clickRightBtn{
    if(_delegate){
        [_delegate selectTabWithLeft:NO];
    }
}

@end
