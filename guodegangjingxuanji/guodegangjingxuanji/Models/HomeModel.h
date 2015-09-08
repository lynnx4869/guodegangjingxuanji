//
//  HomeModel.h
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/6.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject

@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *mediumLogo;
@property (nonatomic, copy) NSString *personDescribe;
@property (nonatomic, copy) NSString *albums;

/*
 "uid": 1000202,
 "nickname": "郭德纲相声",
 "mediumLogo": "http://fdfs.xmcdn.com/group1/M00/0B/3D/wKgDrlESHqyTqakZAADewk1yMt8360_mobile_large.jpg",
 "personDescribe": "都是“真事儿”啊，很“三俗”",
 "albums": 15
 */

@end
