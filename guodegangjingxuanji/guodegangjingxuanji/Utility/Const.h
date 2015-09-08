//
//  Const.h
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/2.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#ifndef guodegangjingxuanji_Const_h
#define guodegangjingxuanji_Const_h

//首页
#define lHomeUrl @"http://app.9nali.com/index/907?page_id=1&device=iPhone&version=1.3.2"
//专辑界面(uid)
#define lAlbumUrl @"http://app.9nali.com/907/bozhus/%@?page_id=1&device=iPhone&version=1.3.2"
//节目界面(albumId, page, 降序(true, false))
#define lProgrammeUrl @"http://app.9nali.com/907/albums/%@?page_id=%d&isAsc=%@&device=iPhone&version=1.3.2"
//播放界面(trackId)
#define lPlayerUrl @"http://app.9nali.com/907/tracks/%@?device=iPhone&version=1.3.2"

//分类界面
#define lClassifyUrl @"http://app.9nali.com/index/651?scale=2&page_id=1&device=iPhone&version=1.3.2"
//分类细节(category_id)
#define lClassifyDetailUrl @"http://app.9nali.com/907/category/%@/tags?page_id=1&device=iPhone&version=1.3.2"
//分类具体专辑(name, 全部:all)
#define lClassifyAlbumUrl @"http://app.9nali.com/907/common_tag/0/%@?page_id=1&device=iPhone&version=1.3.2"

//搜索(搜索内容, page)
#define lSearchUrl @"http://app.9nali.com/search/907/album?condition=%@&page=%@&device=iPhone&version=1.3.2"
//即使搜索(搜索内容)
#define lImmediatelyUrl @"http://app.9nali.com/search/907/album_suggest?condition=%@&device=iPhone&version=1.3.2"

#endif
