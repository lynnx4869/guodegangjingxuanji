//
//  PlayerViewController.h
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/8.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerViewController : UIViewController

@property (nonatomic, copy) NSString *trackId;
@property (nonatomic, strong) NSArray *listArray;
@property (nonatomic, assign) NSInteger curIndex;

@end
