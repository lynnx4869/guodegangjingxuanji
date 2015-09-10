//
//  MyAudioPlayer.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/9.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "MyAudioPlayer.h"

@interface MyAudioPlayer ()

@property (nonatomic, strong) NSThread *thread;

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
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
        [audioSession setActive:YES error:nil];
    }
    return self;
}

- (void)setCurrentPlayer:(Programme *)currentPlayer{
    if(_currentPlayer != currentPlayer){
        _currentPlayer = nil;
        _currentPlayer = currentPlayer;
        
        _thread = nil;
        _thread = [[NSThread alloc] initWithTarget:self selector:@selector(playNew:) object:currentPlayer];
        [_thread start];
    }
}

- (void)playNew:(id)sender{
    
}


@end
