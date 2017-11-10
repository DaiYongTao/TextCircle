//
//  NSString+Extension.m
//  单车微博
//
//  Created by dyt on 15/10/27.
//  Copyright (c) 2015年 戴永涛. All rights reserved.
//

#import "NSString+Extension.h"
#import <Foundation/Foundation.h>

@implementation NSString (Extension)

- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    NSString *version = [UIDevice currentDevice].systemVersion;
    if ([version doubleValue] > 7.0) {
        return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    }else {
        return [self sizeWithFont:font constrainedToSize:maxSize];
    }
}

- (CGSize)sizeWithFont:(UIFont *)font {
    return [self sizeWithFont:font maxW:MAXFLOAT];
}

- (NSInteger)sizeOfFilepath {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 判断是否为文件
    BOOL dir = NO;
    BOOL exists = [fileManager fileExistsAtPath:self isDirectory:&dir];
    
    // 文件\文件夹不存在
    if (exists == NO) return 0;
    
    if (dir) { // 是一个文件夹
        // 遍历caches里面的所有内容 －－ 直接和间接内容
        NSArray *subpaths = [fileManager subpathsAtPath:self];
        NSInteger totalByteSize = 0;
        for (NSString *subpath in subpaths) {
            
            // 1.获取全路径
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            
            // 2.判断是否为文件
            BOOL dir = NO;
            [fileManager fileExistsAtPath:fullSubpath isDirectory:&dir];
            if (dir == NO) {
                totalByteSize += [[fileManager attributesOfItemAtPath:fullSubpath error:nil][NSFileSize] integerValue];
            }
        }
        return totalByteSize;
    }else { // 是一个文件
        return [[fileManager attributesOfItemAtPath:self error:nil][NSFileSize] integerValue];
    }
}


@end
