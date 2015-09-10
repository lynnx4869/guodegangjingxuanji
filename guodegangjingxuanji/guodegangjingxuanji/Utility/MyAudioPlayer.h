//
//  MyAudioPlayer.h
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/9.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ProgrammeModel.h"

@interface MyAudioPlayer : NSObject <AVAudioPlayerDelegate>

+ (instancetype)shareIntance;

@property (nonatomic, strong) NSArray *currentList;
@property (nonatomic, strong) Programme *currentPlayer;
@property (nonatomic, assign) NSInteger currentIndex;

@end
