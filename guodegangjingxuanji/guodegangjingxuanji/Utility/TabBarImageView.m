//
//  TabBarImageView.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/2.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "TabBarImageView.h"
#import "TabBarButtomView.h"

@implementation TabBarImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageNamed:@"tabbar_bg"];
        
        _btnsArray = [NSMutableArray array];
        CGFloat space = (ScreenWidth - 250) / 6;
        
        for(NSInteger i = 0; i < 5; i++){
            if(i == 2){
                continue;
            }
            
            TabBarButtomView *btn = [[TabBarButtomView alloc] initWithFrame:CGRectMake((50+space)*i+space, 0, 50, 49)];
            [self addSubview:btn];
            [_btnsArray addObject:btn];
        }
        
    }
    return self;
}

@end
