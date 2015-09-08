//
//  ToolsImageView.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/6.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "ToolsImageView.h"

@implementation ToolsImageView

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
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake((50+space)*i+space, 0, 50, 49);
            [self addSubview:btn];
            [_btnsArray addObject:btn];
        }
        
    }
    return self;
}

@end
