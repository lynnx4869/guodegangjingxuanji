//
//  AlbumModel.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/6.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "AlbumModel.h"

@implementation AlbumModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _albumsArray = [NSMutableArray array];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end

@implementation Album

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
