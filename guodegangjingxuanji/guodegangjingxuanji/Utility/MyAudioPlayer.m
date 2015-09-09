//
//  MyAudioPlayer.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/9.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "MyAudioPlayer.h"

@interface MyAudioPlayer ()

@end

@implementation MyAudioPlayer

+ (instancetype)shareIntance{
    static MyAudioPlayer *myAudioPlayer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(myAudioPlayer == nil){
            myAudioPlayer = [[MyAudioPlayer alloc] init];
        }
    });
    return myAudioPlayer;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentList = [NSMutableArray array];
    }
    return self;
}

- (void)setCurrentPlayer:(Programme *)currentPlayer{
    if(_currentPlayer != currentPlayer){
        _currentPlayer = nil;
        _currentPlayer = currentPlayer;
        
        _player = nil;
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:currentPlayer.playUrl64] error:nil];
        _player.delegate = self;
    }
}

@end
