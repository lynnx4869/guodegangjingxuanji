//
//  TabBarButtomView.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/2.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "TabBarButtomView.h"

@implementation TabBarButtomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        _isSelected = NO;
        
        _image = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 40, 35)];;
        [self addSubview:_image];
        
        _name = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 50, 12)];
        _name.textAlignment = 1;
        _name.font = [UIFont systemFontOfSize:10];
        _name.textColor = [UIColor colorWithRed:145/255.0 green:145/255.0 blue:145/255.0 alpha:1.0];
        [self addSubview:_name];
    }
    return self;
}

- (void)setIsSelected:(BOOL)isSelected{
    if(_isSelected != isSelected){
        _isSelected = isSelected;
        
        _image.highlighted = isSelected;
        
        if(isSelected){
            _name.textColor = [UIColor colorWithRed:252/255.0 green:72/255.0 blue:10/255.0 alpha:1.0];
        }else{
            _name.textColor = [UIColor colorWithRed:145/255.0 green:145/255.0 blue:145/255.0 alpha:1.0];
        }
    }
}

@end
