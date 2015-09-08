//
//  ProgrammeSectionView.h
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/7.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectTabDelegate <NSObject>

- (void)selectTabWithLeft:(BOOL)isLeft;

@end

@interface ProgrammeSectionView : UIView

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;

@property (nonatomic, weak) id<SelectTabDelegate> delegate;

@end
