//
//  ProgrammeModel.h
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/7.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProgrammeModel : NSObject

@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *smallLogo;
@property (nonatomic, copy) NSString *albumId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *coverSmall;
@property (nonatomic, copy) NSString *coverLarge;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *richIntro;
@property (nonatomic, copy) NSString *updatedAt;
@property (nonatomic, copy) NSString *playCount;
@property (nonatomic, copy) NSString *tracks;

@end

@interface Programme : NSObject

@property (nonatomic, copy) NSString *trackId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *coverSmall;
@property (nonatomic, copy) NSString *coverLarge;
@property (nonatomic, copy) NSString *playtimes;
@property (nonatomic, copy) NSString *playUrl32;
@property (nonatomic, copy) NSString *playUrl64;
@property (nonatomic, copy) NSString *mp3size_32;
@property (nonatomic, copy) NSString *mp3size_64;
@property (nonatomic, copy) NSString *albumId;
@property (nonatomic, copy) NSString *albumUid;
@property (nonatomic, copy) NSString *duration;
@property (nonatomic, copy) NSString *createdAt;
@property (nonatomic, copy) NSString *updatedAt;

@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *rich_intro;
@property (nonatomic, copy) NSString *lyric;

@end
