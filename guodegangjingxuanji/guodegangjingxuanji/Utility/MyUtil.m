//
//  MyUtil.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/8.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "MyUtil.h"

@implementation MyUtil

+ (NSString *)getDateFromTime:(NSString *)times{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    NSNumber *number = [NSNumber numberWithDouble:time-times.doubleValue/1000];
    
    int year = number.intValue / 31536000;
    if(year == 0){
        int month = number.intValue / 2592000;
        if(month == 0){
            int day = number.intValue / 86400;
            if(day == 0){
                int hour = number.intValue / 3600;
                if(hour == 0){
                    int minute = number.intValue / 60;
                    if(minute == 0){
                        int second = number.intValue;
                        return [NSString stringWithFormat:@"%d秒前", second];
                    }else{
                        return [NSString stringWithFormat:@"%d分钟前", minute];
                    }
                }else{
                    return [NSString stringWithFormat:@"%d小时前", hour];
                }
            }else{
                return [NSString stringWithFormat:@"%d日前", day];
            }
        }else{
            return [NSString stringWithFormat:@"%d月前", month];
        }
    }else{
        return [NSString stringWithFormat:@"%d年前", year];
    }
}

+ (NSString *)getTimeFromTime:(NSString *)times{
    int seconds = times.intValue % 60;
    int minutes = (times.intValue / 60) % 60;
    int hours = times.intValue / 3600;
    
    NSString *sString = @"";
    NSString *mString = @"";
    NSString *hString = @"";
    
    if(seconds < 10){
        sString = [NSString stringWithFormat:@"0%d", seconds];
    }else{
        sString = [NSString stringWithFormat:@"%d", seconds];
    }
    if(minutes < 10){
        mString = [NSString stringWithFormat:@"0%d", minutes];
    }else{
        mString = [NSString stringWithFormat:@"%d", minutes];
    }
    if(hours < 10){
        hString = [NSString stringWithFormat:@"0%d", hours];
    }else{
        hString = [NSString stringWithFormat:@"%d", hours];
    }
    
    if(hours == 0){
        return [NSString stringWithFormat:@"%@:%@", mString, sString];
    }else{
        return [NSString stringWithFormat:@"%@:%@:%@", hString, mString, sString];
    }
}

@end
