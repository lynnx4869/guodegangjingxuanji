//
//  AlbumModel.h
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/6.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumModel : NSObject

@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *largeLogo;
@property (nonatomic, copy) NSString *personalSignature;
@property (nonatomic, strong) NSMutableArray *albumsArray;

@end

@interface Album : NSObject

@property (nonatomic, copy) NSString *albumId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *coverSmall;
@property (nonatomic, copy) NSString *tracks;
@property (nonatomic, copy) NSString *updatedAt;
@property (nonatomic, copy) NSString *finished;

@end
